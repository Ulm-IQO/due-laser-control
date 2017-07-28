/*
   A/D - D/A with PID control for controlling Sirah
   Matisse laser with external reference cavity and
   strain gauge.

   (c) 2016 Jan M. Binder <jan-git@nlogn.org>

   Licensed under GPLv3.
*/

#include <SPI.h>
#include <stdint.h>

#include "libraries/DueTimer/DueTimer.h"

#include "libraries/AD57XX/AD57XX_Comm.h"
#include "libraries/AD57XX/AD57XX.h"

#include "boardsetup.h"
#include "adc_setup.h"
#include "scpi.h"
#include "pid.h"

// scan speed pid
piddata_t velpid = {0, 0, 0, 5000, 1000, { -1000, 1000}, 0.001, 0, 0 };
// position pid
piddata_t pospid = {0, 0, 0, 2000000, 1000, { -520000, 520000}, 0.01, 0.00001, 0 };

// Board setup
// Pin for clock output
const int timebasePin = 12;
const int rampPin = 13;

uint8_t onBoardGain = 2;
float vRef1 = 5.0;
float vRef2 = 3.2;

// DAC readback value
volatile int32_t readValue = 0;
// DAC target value
volatile int32_t currentValue = 0;

// voltage ramp direction
volatile int8_t rampDir = 0;
// voltage ramp multiplier (DAC units per step)
volatile int16_t rampMult = 1;
// Voltage ramp divider (not used)
volatile uint16_t rampDiv = 1;
// voltage ramp lower limit
volatile int32_t rampStart = -524287;
// voltage ramp upper limit
volatile int32_t rampStop = 524287;
// count steps, lots of steps
volatile uint32_t rampStepCount = 0;
// last read data from AD7176 ADC
volatile int32_t adcData[4] = {0, 0, 0, 0};
// last read status from AD7176 ADC
volatile uint8_t adcStatus[4] = {0, 0, 0, 0};
// output clock divider (multiples of timer interrupt)
volatile uint8_t timebaseDiv = 20;
// output clock counter
volatile uint8_t timebaseCtr = 0;
// output clock enable
bool timebaseval = false;
// determine actibe pid mechanism
volatile uint8_t pidStatus = 0;

volatile int32_t lastdata[4] = {0, 0, 0, 0};

// voltage speed (DAC units per step) for velocity pid
volatile int32_t rampSpeed = 0;
int32_t speedarr[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int32_t speedTotal = 0;
uint8_t speedIndex = 0;

volatile uint8_t adcdivcount = 0;
uint8_t dacdivcount = 0;

// Microsoft retardation
volatile int32_t printData = 0;

# define READ_BUF_LEN 80
char line_buffer[READ_BUF_LEN];
unsigned char read_length;
int offset = 0;

struct scpi_parser_context ctx;

void stepMe(void);

void setup() {
  Serial1.begin(9600);
  Serial1.println("Starting up!");
  delay(100);

  SerialUSB.begin(0);
  Serial1.println("SerialUSB setup done.");
  delay(100);

  pinsetup_due_levelconverter(due_board);
  Serial1.println("Pin setup done.");


  setup_scpi_command_tree(&ctx);
  delay(100);

  // set up clock output
  pinMode(timebasePin, OUTPUT);
  digitalWrite(timebasePin, LOW);
  // set up communication pin modes
  pinMode(AD7176_CS_PIN, OUTPUT);
  pinMode(AD7176_SYNC_PIN , OUTPUT);
  pinMode(AD57XX_SYNC_PIN , OUTPUT);

  digitalWrite(AD7176_CS_PIN, HIGH);
  digitalWrite(AD7176_SYNC_PIN , HIGH);
  digitalWrite(AD57XX_SYNC_PIN , HIGH);

  delay(100);

  // AD5791 initialisation
  Serial1.print("SETUP: ");
  Serial1.println(AD57XX_Init(AD5791), HEX);

  Serial1.println("stat");
  Serial1.println(AD57XX_GetRegisterValue(AD57XX_REG_CTRL), HEX);
  Serial1.println(AD57XX_GetRegisterValue(AD57XX_REG_CTRL), HEX);

  AD57XX_EnableOutput(1);

  Serial1.println("stat");
  Serial1.println(AD57XX_GetRegisterValue(AD57XX_REG_CTRL), HEX);
  Serial1.println(AD57XX_GetRegisterValue(AD57XX_REG_CTRL), HEX);

  delay(100);

  // AD7176 initialisation
  initADC7176();
  delay(100);
  initADC7176();

  // set up timed control loop (1 ms)
  //Timer1.initialize(1000);
  DueTimer::getAvailable().attachInterrupt(stepMe).setPeriod(100).start();
  offset = 0;
}

void loop() {
  int avail = Serial1.available();
  if (offset + avail < READ_BUF_LEN) {
    read_length = Serial1.readBytesUntil('\n', &line_buffer[offset], avail);
    if (read_length < avail) {
      line_buffer[offset + read_length] = '\n';
    }
  } else {
    read_length = Serial1.readBytesUntil('\n', &line_buffer[offset], READ_BUF_LEN - offset);
  }

  if (line_buffer[offset + read_length] == '\n') {
    offset += read_length;
    scpi_error_t result = scpi_execute_command(&ctx, line_buffer, offset);
    if (result != SCPI_SUCCESS) {
      line_buffer[offset + 1] = 0;
      Serial1.print("CMD? ");
      Serial1.println(line_buffer);
    }
    memset(line_buffer, 0, sizeof(line_buffer));
    offset = 0;
  } else {
    if (offset + read_length == READ_BUF_LEN) {
      Serial1.println("ERR");
      memset(line_buffer, 0, sizeof(line_buffer));
      offset = 0;
    } else {
      offset += read_length;
    }
  }
  /*

  */
}

void stepMe(void) {
  timebaseCtr = ++timebaseCtr % timebaseDiv;
  if (timebaseCtr == 0) {
    timebaseval = !timebaseval;
    digitalWrite(timebasePin, timebaseval);
  }

  dacdivcount = (dacdivcount + 1) % 10;
  if (dacdivcount == 0) {
    if (rampDir != 0) {

      currentValue += (long)rampMult * rampDir;
      rampStepCount++;

      AD57XX_LDAC_LOW();
      AD57XX_SetRegisterValue(AD57XX_REG_DAC, currentValue);
      AD57XX_LDAC_HIGH();

      if (currentValue + rampMult >= rampStop) rampDir = -1;
      if (currentValue - rampMult <= rampStart) rampDir = 1;

    } else if (pidStatus == 2) {
      currentValue += rampSpeed;
      rampStepCount++;

      AD57XX_LDAC_LOW();
      AD57XX_SetRegisterValue(AD57XX_REG_DAC, currentValue);
      AD57XX_LDAC_HIGH();

      if (currentValue > rampStop) {
        currentValue = rampStop;
        velpid.setpoint = -abs(velpid.setpoint);
      }
      if (currentValue < rampStart) {
        currentValue = rampStart;
        velpid.setpoint = abs(velpid.setpoint);
      }
    } else {
      rampStepCount = 0;

      AD57XX_LDAC_LOW();
      AD57XX_SetRegisterValue(AD57XX_REG_DAC, currentValue);
      AD57XX_LDAC_HIGH();
    }
    readValue = (long)AD57XX_GetRegisterValue(AD57XX_REG_DAC) - 1048576;
  }

  adcdivcount = (adcdivcount + 1) % 100;
  if (adcdivcount == 0) {
    // position mode
    if (pidStatus == 1) {
      PIDstep(&pospid, adcData[0]);
      currentValue = pospid.cv;
    }
    // velocity mode
    if (pidStatus == 2) {
      speedTotal -= speedarr[speedIndex];
      speedarr[speedIndex] = adcData[0] - lastdata[0];
      lastdata[0] = adcData[0];
      speedTotal += speedarr[speedIndex];
      speedIndex = (speedIndex + 1) % 10;

      PIDstep(&velpid, speedTotal / 10);

      rampSpeed = velpid.cv;
    }

  } else if (adcdivcount == 0) {
    digitalWrite(AD7176_SYNC_PIN, LOW);
  } else if (adcdivcount == 1) {
    digitalWrite(AD7176_SYNC_PIN, HIGH);
  }
  if (adcdivcount % 5 == 4) {
    /* Read the value of the Status Register */
    int32_t data = 0;
    int32_t ret = AD7176_ReadData(&data);

    uint16_t extra = AD7176_regs[Data_Register].extra;
    if (ret >= 0) {
      uint8_t channel = STATUS_REG_CH(extra);
      adcStatus[channel] = extra;

      /* Check the RDY bit in the Status Register (extra & STATUS_REG_RDY) == 0 */
      if (
        !(extra & STATUS_REG_ADC_ERR)
        && !(extra & STATUS_REG_CRC_ERR)
        && !(extra & STATUS_REG_REG_ERR)
      ) {
        adcData[channel] = data;
      }
    }
  }
  if ((adcdivcount % 10 == 0) && printData) {
    SerialUSB.print(rampStepCount);
    SerialUSB.print(" ");
    SerialUSB.print(currentValue);
    SerialUSB.print(" ");
    SerialUSB.print(adcData[1]);
    SerialUSB.print(" ");
    SerialUSB.println(adcStatus[1]);
  }
}

/*
   Respond to *IDN?
*/
scpi_error_t identify(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println("OIC,Laser Scan,1,10");

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

/*
   Respond to *RST
*/
scpi_error_t reset(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println("Not implemented.");

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_rampdirection(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println(rampDir);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_rampdirection(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  int8_t value = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  value = constrain(atoi(args->value), -1, 1);

  rampDir = value;

  Serial1.println(value);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_rampspeed(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println(rampMult);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_rampspeed(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint16_t value = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  value = constrain(atol(args->value), 1, 65535);

  rampMult = value;

  Serial1.println(rampMult);
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_ramplimits(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.print(rampStart);
  Serial1.print(",");
  Serial1.println(rampStop);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_ramplimits(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  long valuestart = -100000;
  long valuestop = 100000;
  int8_t res = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  res = sscanf(args->value, "%li %li", &valuestart, &valuestop);
  valuestop = (long)constrain(valuestop, -524287l, 524287l );
  valuestart  = (long)constrain(valuestart, -524287l, 524287l );

  valuestop = (long)constrain(valuestop, valuestart, 524287l );
  valuestart = (long)constrain(valuestart, -524287l, valuestop );

  rampStart = valuestart;
  rampStop = valuestop;

  Serial1.print(rampStart);
  Serial1.print(" ");
  Serial1.println(rampStop);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_voltage(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println(readValue);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_voltage(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  long output_value = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  output_value = constrain(atol(args->value), -524287, 524287);
  if (rampDir == 0) {
    currentValue = output_value;
  }


  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t reset_voltage(struct scpi_parser_context* context, struct scpi_token* command) {

  AD57XX_CLR_LOW();
  AD57XX_LDAC_LOW();
  AD57XX_RESET_LOW();
  delay(1);
  AD57XX_CLR_HIGH();
  AD57XX_LDAC_HIGH();
  AD57XX_RESET_HIGH();
  AD57XX_EnableOutput(1);

  Serial1.println("RESET");

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t adc_init(struct scpi_parser_context* context, struct scpi_token* command) {
  initADC7176();

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_adc_value(struct scpi_parser_context* context, struct scpi_token* command) {

  Serial1.print(adcData[0]);
  Serial1.print(' ');
  Serial1.print(adcData[1]);
  Serial1.print(' ');
  Serial1.print(adcData[2]);
  Serial1.print(' ');
  Serial1.println(adcData[3]);
  Serial1.print(adcStatus[0], HEX);
  Serial1.print(' ');
  Serial1.print(adcStatus[1], HEX);
  Serial1.print(' ');
  Serial1.print(adcStatus[2], HEX);
  Serial1.print(' ');
  Serial1.println(adcStatus[3], HEX);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_adc_regs(struct scpi_parser_context* context, struct scpi_token* command) {
  enum AD7176_registers regNr;
  for (regNr = Status_Register; regNr <= Gain_3; ++regNr) {
    Serial1.print(AD7176_regs[regNr].name);
    Serial1.print(" Read ");
    Serial1.print(AD7176_ReadRegister(&AD7176_regs[regNr]));
    Serial1.print(" bytes: ");
    Serial1.println(AD7176_regs[regNr].value, HEX);
  }
  Serial1.println();
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_adc_reg(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t regNr = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  regNr = constrain(atol(args->value), Status_Register, Communications_Register);


  Serial1.print(AD7176_regs[regNr].name);
  Serial1.print(" Read ");
  Serial1.print(AD7176_ReadRegister(&AD7176_regs[regNr]));
  Serial1.print(" bytes: ");
  Serial1.println(AD7176_regs[regNr].value, HEX);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_adc_reg(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t regnr = 1;
  uint32_t regcontent = 0;
  int8_t res = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  res = sscanf(args->value, "%u %lx", &regnr, &regcontent);
  Serial1.print(regnr);
  Serial1.print(' ');
  Serial1.print(regcontent, HEX);
  Serial1.print(' ');

  AD7176_regs[regnr].value = regcontent;
  AD7176_WriteRegister(AD7176_regs[regnr]);
  AD7176_ReadRegister(&AD7176_regs[regnr]);

  uint32_t newval = AD7176_regs[regnr].value;
  Serial1.println(newval, HEX);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}


scpi_error_t set_pid_mode(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t pvalue = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  pvalue = constrain(atol(args->value), 0, 2);
  pidStatus = pvalue;

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_mode(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println(pidStatus);
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_pid_kp(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;
  float pvalue = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  pvalue = atof(args->value);

  if (whichpid == 2) {
    velpid.kP = pvalue;
  } else {
    pospid.kP = pvalue;
  }
  Serial1.println(pvalue);


  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_kp(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2) {
    Serial1.println(velpid.kP);
  } else {
    Serial1.println(pospid.kP);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_pid_ki(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;
  float ivalue = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  ivalue = atof(args->value);

  if (whichpid == 2) {
    velpid.kI = ivalue;
  } else {
    pospid.kI = ivalue;
  }
  Serial1.println(ivalue);


  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_ki(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2) {
    Serial1.println(velpid.kI);
  } else {
    Serial1.println(pospid.kI);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_pid_kd(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;
  float dvalue = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  dvalue = atof(args->value);

  if (whichpid == 2) {
    velpid.kD = dvalue;
  } else {
    pospid.kD = dvalue;
  }
  Serial1.println(dvalue);


  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_kd(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2) {
    Serial1.println(velpid.kD);
  } else {
    Serial1.println(pospid.kD);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_pid_setpoint(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;
  int32_t svalue = 0;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  svalue = atol(args->value);

  if (whichpid == 2) {
    velpid.setpoint = svalue;
  } else {
    pospid.setpoint = svalue;
  }
  Serial1.println(svalue);


  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_setpoint(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2) {
    Serial1.println(velpid.setpoint);
  } else {
    Serial1.println(pospid.setpoint);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_cv(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while (args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ) {
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2) {
    Serial1.println(velpid.cv);
  } else {
    Serial1.println(pospid.cv);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_print(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println(printData);

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t set_print(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;

  args = command;
  while (args != NULL && args->type == 0) {
    args = args->next;
  }
  printData = constrain(atol(args->value), 0, 1);
  
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

