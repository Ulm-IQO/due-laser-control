/*
 * A/D - D/A with PID control for controlling Sirah
 * Matisse laser with external reference cavity and
 * strain gauge.
 * 
 * (c) 2016 Jan M. Binder <jan-git@nlogn.org>
 * 
 * Licensed under GPLv3.
 */

#include <SPI.h>
#include <stdint.h>

#include "libraries/DueTimer/DueTimer.h"
#include "libraries/ArduinoSCPIParser/scpiparser.h"

#include "libraries/AD7176/AD7176_regs.h"
#include "libraries/AD7176/AD7176_Comm.h"
#include "libraries/AD7176/AD7176.h"

#include "libraries/AD57XX/AD57XX_Comm.h"
#include "libraries/AD57XX/AD57XX.h"

// data for pid calculation
typedef struct _pid_data {
  // control value
  int32_t cv;
  // integration variable for I term
  int32_t integrated;
  // last difference between setpoint and process value for D term
  int32_t previousdelta;
  // setpoint for PID
  int32_t setpoint;
  // length of time interval between pid steps
  int32_t timestep;
  // limits for control value
  int32_t limits[2];
  // constants for P, I and D terms
  float kP, kI, kD;
} piddata_t;

// scan speed pid
piddata_t velpid = {0, 0, 0, 5000, 1000, {-1000, 1000}, 0.001, 0, 0 };
// position pid
piddata_t pospid = {0, 0, 0, 2000000, 1000, {-520000, 520000}, 0.01, 0.00001, 0 };


st_reg init_state[] = 
{
    {0x00, 0x00l,   1, "Stat_Reg "}, //Status_Register
    {0x01, 0x8000l, 2, "ADCModReg"}, //ADC_Mode_Register
    {0x02, 0x0800l, 2, "IfModeReg"}, //Interface_Mode_Register
    {0x03, 0x0000l, 3, "Reg_Check"}, //Register_Check
    {0x04, 0x0000l, 3, "ADC_Data "}, //Data_Register
    {0x06, 0x0800l, 2, "GPIO_Conf"}, //IOCon_Register
    {0x07, 0x0000l, 2, "ID_ST_Reg"}, //ID_st_reg
    {0x10, 0x8001l, 2, "Ch_Map_0 "}, //CH_Map_1
    {0x11, 0x8023l, 2, "Ch_Map_1 "}, //CH_Map_2
    {0x12, 0x0000l, 2, "Ch_Map_2 "}, //CH_Map_3
    {0x13, 0x0000l, 2, "Ch_Map_3 "}, //CH_Map_4
    {0x20, 0x0000l, 2, "SetupCfg0"}, //Setup_Config_1
    {0x21, 0x0000l, 2, "SetupCfg1"}, //Setup_Config_2
    {0x22, 0x0000l, 2, "SetupCfg2"}, //Setup_Config_3
    {0x23, 0x0000l, 2, "SetupCfg3"}, //Setup_Config_4
    {0x28, 0x020Bl, 2, "FilterCf0"}, //Filter_Config_1
    {0x29, 0x0200l, 2, "FilterCf1"}, //Filter_Config_2
    {0x2a, 0x0200l, 2, "FilterCf2"}, //Filter_Config_3
    {0x2b, 0x0200l, 2, "FilterCf3"}, //Filter_Config_4
    {0x30, 0l,      3, "Offset_0 "}, //Offset_1
    {0x31, 0l,      3, "Offset_1 "},  //Offset_2
    {0x32, 0l,      3, "Offset_2 "}, //Offset_3
    {0x33, 0l,      3, "Offset_3 "}, //Offset_4
    {0x38, 0l,      3, "Gain_0   "}, //Gain_1
    {0x39, 0l,      3, "Gain_1   "}, //Gain_2
    {0x3a, 0l,      3, "Gain_2   "}, //Gain_3
    {0x3b, 0l,      3, "Gain_3   "}, //Gain_4
    {0xFF, 0l,      1, "Comm_Reg "} //Communications_Register
};

// SCPI Parser setup
struct scpi_parser_context ctx;

scpi_error_t identify(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t get_voltage(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t set_voltage(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t reset_voltage(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t get_rampdirection(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t set_rampdirection(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t get_rampspeed(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t set_rampspeed(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t get_ramplimits(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t set_ramplimits(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t get_adc_value(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_adc_regs(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_adc_reg(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t set_adc_reg(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t adc_init(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t set_pid_mode(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_mode(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t set_pid_kp(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_kp(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t set_pid_ki(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_ki(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t set_pid_kd(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_kd(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t set_pid_setpoint(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_setpoint(struct scpi_parser_context* context, struct scpi_token* command);

scpi_error_t get_pid_p(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_i(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_d(struct scpi_parser_context* context, struct scpi_token* command);
scpi_error_t get_pid_cv(struct scpi_parser_context* context, struct scpi_token* command);


// Board setup
// Pin for clock output
const int timebasePin = 13;

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
// last read data from AD7176 ADC
volatile int32_t adcData[4] = {0, 0, 0, 0};
// output clock divider (multiples of timer interrupt)
volatile uint8_t timebaseDiv = 1;
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

uint8_t adcdivcount = 0;

void stepMe(void);

void PIDstep(piddata_t* p, int32_t pv){
  int32_t delta = p->setpoint - pv;
  p->integrated += delta;
  
  // Calculate PID controller:
  float P = p->kP * (float)delta;
  float I = p->kI * (float)p->timestep * (float)p->integrated;
  float D = p->kD / (float)p->timestep * (float)(delta - p->previousdelta);

  p->cv += P + I + D;
  p->previousdelta = delta;
  
  // limit contol output to maximum permissible limits
  if (p->cv > p->limits[1]){
    p->cv = p->limits[1];
  }
  if (p->cv < p->limits[0]){
    p->cv = p->limits[0];
  }
}

void initADC7176(){
  Serial1.print("SETUP: ");
  Serial1.println(AD7176_Setup(), HEX);
  Serial1.println("REGS:");

  // copy of AD7176 registers
  enum AD7176_registers regNr;
  for(regNr = ADC_Mode_Register; regNr < Offset_1; ++regNr) {
    if (regNr == ADC_Mode_Register) continue;
    if (regNr == Interface_Mode_Register) continue;
    if (regNr == Register_Check) continue;
    //if (regNr == Data_Register) continue;
    Serial1.print("Write ");
    Serial1.print(init_state[regNr].name);
    Serial1.print(" ");
    Serial1.print(regNr);
    Serial1.print(" ");
    Serial1.print(init_state[regNr].value, HEX);
    Serial1.print(" ");
    Serial1.print(AD7176_WriteRegister(init_state[regNr]));
    Serial1.print(" bytes. Read ");
    Serial1.print(AD7176_ReadRegister(&AD7176_regs[regNr]));
    Serial1.print(" bytes: ");
    Serial1.println(AD7176_regs[regNr].value, HEX);
  }
}



void setup() {
  Serial1.begin(115200);
  SerialUSB.begin(0);
  Serial1.println("Starting up!");
  
  struct scpi_command *source, *measure, *pidcmd, *velcmd, *poscmd;
  /* First, initialise the parser. */
  scpi_init(&ctx);

  /*
   * Set up command tree.
   *
   *  *IDN?         -> identify
   *  :SOURCE
   *    :VOLTage    -> set_voltage
   *    :VOLTage?   -> get_voltage
   *    :REset      -> reset_voltage
   *    :Ramp
   *    :Ramp?
   *    :RampSpeed
   *    :RampSpeed?
   *    :RampLimits
   *    :RampLimits?
   *  :MEASure
   *    :VALue?   -> get__adc_value
   *    :REGisters? -> get_adc_regs
   *    :REGister?  -> get_adc_reg
   *    :REGister   -> set_adc_reg
   *    :INITialize -> adc_init
   *  :PID
   *    :KP         -> set_pid_kp
   *    :KP?        -> get_pid_kp
   *    :KI         -> set_pid_ki
   *    :KI?        -> get_pid_ki
   *    :KD         -> set_pid_kd
   *    :KD?        -> get_pid_kd
   *    :SetPoint?  -> get_pid_setpoint
   *    :SetPoint   -> set_pid_setpoint
   *    :ControlValue? -> get_pid_cv
   */
   
  scpi_register_command(ctx.command_tree, SCPI_CL_SAMELEVEL, "*IDN?", 5, "*IDN?", 5, identify);
  source = scpi_register_command(ctx.command_tree, SCPI_CL_CHILD, "SOURCE", 6, "SOUR", 4, NULL);

  
  scpi_register_command(source, SCPI_CL_CHILD, "RESET", 5, "RE", 2, reset_voltage);
  scpi_register_command(source, SCPI_CL_CHILD, "VOLTAGE", 7, "VOLT", 4, set_voltage);
  scpi_register_command(source, SCPI_CL_CHILD, "VOLTAGE?", 8, "VOLT?", 5, get_voltage);
  
  scpi_register_command(source, SCPI_CL_CHILD, "RAMP?", 5, "R?", 2, get_rampdirection);
  scpi_register_command(source, SCPI_CL_CHILD, "RAMP", 4, "R", 1, set_rampdirection);
  
  scpi_register_command(source, SCPI_CL_CHILD, "RAMPSPEED?", 10, "RS?", 3, get_rampspeed);
  scpi_register_command(source, SCPI_CL_CHILD, "RAMPSPEED", 9, "RS", 2, set_rampspeed);

  scpi_register_command(source, SCPI_CL_CHILD, "RAMPLIMITS?", 11, "RL?", 3, get_ramplimits);
  scpi_register_command(source, SCPI_CL_CHILD, "RAMPLIMITS", 10, "RL", 2, set_ramplimits);

  measure = scpi_register_command(ctx.command_tree, SCPI_CL_CHILD, "MEASURE", 7, "MEAS", 4, NULL);
  scpi_register_command(measure, SCPI_CL_CHILD, "VALUE?", 6, "VAL?", 4, get_adc_value);
  scpi_register_command(measure, SCPI_CL_CHILD, "REGISTERS?", 10, "REG?", 4, get_adc_regs);
  scpi_register_command(measure, SCPI_CL_CHILD, "REGISTER", 8, "REG", 3, set_adc_reg);
  scpi_register_command(measure, SCPI_CL_CHILD, "INITIALIZE", 10, "INIT", 4, adc_init);

  pidcmd = scpi_register_command(ctx.command_tree, SCPI_CL_CHILD, "PID", 3, "PID", 3, NULL);
  scpi_register_command(pidcmd, SCPI_CL_CHILD, "MODE?", 5, "M?", 2, get_pid_mode);
  scpi_register_command(pidcmd, SCPI_CL_CHILD, "MODE", 4, "M", 1, set_pid_mode);
  
  velcmd = scpi_register_command(pidcmd, SCPI_CL_CHILD, "VELOCITY", 8, "VEL", 3, NULL);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "KP", 2, "KP", 2, set_pid_kp);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "KP?", 3, "KP?", 3, get_pid_kp);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "KI", 2, "KI", 2, set_pid_ki);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "KI?", 3, "KI?", 3, get_pid_ki);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "KD", 2, "KD", 2, set_pid_kd);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "KD?", 3, "KD?", 3, get_pid_kd);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "SETPOINT", 8, "SP", 2, set_pid_setpoint);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "SETPOINT?", 9, "SP?", 3, get_pid_setpoint);
  scpi_register_command(velcmd, SCPI_CL_CHILD, "CONTROLVALUE?", 13, "CV?", 3, get_pid_cv);
  
  poscmd = scpi_register_command(pidcmd, SCPI_CL_CHILD, "POSITION", 8, "POS", 3, NULL);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "KP", 2, "KP", 2, set_pid_kp);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "KP?", 3, "KP?", 3, get_pid_kp);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "KI", 2, "KI", 2, set_pid_ki);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "KI?", 3, "KI?", 3, get_pid_ki);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "KD", 2, "KD", 2, set_pid_kd);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "KD?", 3, "KD?", 3, get_pid_kd);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "SETPOINT", 8, "SP", 2, set_pid_setpoint);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "SETPOINT?", 9, "SP?", 3, get_pid_setpoint);
  scpi_register_command(poscmd, SCPI_CL_CHILD, "CONTROLVALUE?", 13, "CV?", 3, get_pid_cv);
  
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
  Serial1.println(AD57XX_GetRegisterValue(AD57XX_REG_CTRL),HEX);
  Serial1.println(AD57XX_GetRegisterValue(AD57XX_REG_CTRL),HEX);

  delay(100);
  
  // AD7176 initialisation
  initADC7176();
  delay(100);
  initADC7176();

  // set up timed control loop (1 ms)
  //Timer1.initialize(1000);
  DueTimer::getAvailable().attachInterrupt(stepMe).setPeriod(1000).start();
}
 
void loop() {
  // setup for SCPI interpreter
  char line_buffer[256];
  memset(line_buffer, 0, sizeof(line_buffer));
  unsigned char read_length;
  
  // Read in a line and execute it.
  read_length = Serial1.readBytesUntil('\n', line_buffer, 256);
  if(read_length > 0) {
    scpi_execute_command(&ctx, line_buffer, read_length);
  }
}

void stepMe(void){
    timebaseCtr = ++timebaseCtr % timebaseDiv;
    if (timebaseCtr == 0) {
      timebaseval = !timebaseval;
      digitalWrite(timebasePin, timebaseval);
    }
    if (rampDir != 0) {
      
      currentValue += (long)rampMult * rampDir;
      
      AD57XX_LDAC_LOW();
      AD57XX_SetRegisterValue(AD57XX_REG_DAC, currentValue);
      AD57XX_LDAC_HIGH();

      if(currentValue + rampMult >= rampStop) rampDir = -1;
      if(currentValue - rampMult <= rampStart) rampDir = 1;
      
    } else if (pidStatus == 2) {
      currentValue += rampSpeed;
      
      AD57XX_LDAC_LOW();
      AD57XX_SetRegisterValue(AD57XX_REG_DAC, currentValue);
      AD57XX_LDAC_HIGH();
      
      if(currentValue > rampStop){
        currentValue = rampStop;
        velpid.setpoint = -abs(velpid.setpoint);
      }
      if(currentValue < rampStart){
        currentValue = rampStart;
        velpid.setpoint = abs(velpid.setpoint);
      }
    } else {
      AD57XX_LDAC_LOW();
      AD57XX_SetRegisterValue(AD57XX_REG_DAC, currentValue);
      AD57XX_LDAC_HIGH();
    }

    readValue = (long)AD57XX_GetRegisterValue(AD57XX_REG_DAC) - 1048576;

    adcdivcount = (adcdivcount + 1) % 10;
    if (adcdivcount == 0){
      // position mode
      if(pidStatus == 1){
        PIDstep(&pospid, adcData[0]);
        currentValue = pospid.cv;
      }
      // velocity mode
      if(pidStatus == 2){
        speedTotal -= speedarr[speedIndex];
        speedarr[speedIndex] = adcData[0] - lastdata[0];
        lastdata[0] = adcData[0];
        speedTotal += speedarr[speedIndex];
        speedIndex = (speedIndex + 1) % 10;
        
        PIDstep(&velpid, speedTotal/10);
        
        rampSpeed = velpid.cv;
      }
      
      SerialUSB.println(adcData[0]);
    
    } else if (adcdivcount == 1) {
      digitalWrite(AD7176_SYNC_PIN, LOW);
    } else if (adcdivcount == 2) {
      digitalWrite(AD7176_SYNC_PIN, HIGH);
    } else if (adcdivcount == 4) {
      /* Read the value of the Status Register */
      int32_t ret = AD7176_ReadRegister(&AD7176_regs[Status_Register]);
      if(ret >= 0) {
        /* Check the RDY bit in the Status Register */
        if ((AD7176_regs[Status_Register].value & STATUS_REG_RDY) == 0
          && !(AD7176_regs[Status_Register].value & STATUS_REG_ADC_ERR)
          && !(AD7176_regs[Status_Register].value & STATUS_REG_CRC_ERR)
          && !(AD7176_regs[Status_Register].value & STATUS_REG_REG_ERR)
          ){
          uint8_t channel = AD7176_regs[Status_Register].value & 0x03;
          int32_t data = 0;
          AD7176_ReadData(&data);
          if(data != 0){
            adcData[channel] = data;
          }
        }
      }
    } else if (adcdivcount == 6) {
      /* Read the value of the Status Register */
      int32_t ret = AD7176_ReadRegister(&AD7176_regs[Status_Register]);
      if(ret >= 0) {
        /* Check the RDY bit in the Status Register */
        if ((AD7176_regs[Status_Register].value & STATUS_REG_RDY) == 0
          && !(AD7176_regs[Status_Register].value & STATUS_REG_ADC_ERR)
          && !(AD7176_regs[Status_Register].value & STATUS_REG_CRC_ERR)
          && !(AD7176_regs[Status_Register].value & STATUS_REG_REG_ERR)
          ){
          uint8_t channel = AD7176_regs[Status_Register].value & 0x03;
          int32_t data = 0;
          AD7176_ReadData(&data);
          if(data != 0){
            adcData[channel] = data;
          }
        }
      }
    }
}

/*
 * Respond to *IDN?
 */
scpi_error_t identify(struct scpi_parser_context* context, struct scpi_token* command) {
  Serial1.println("OIC,Laser Scan,1,10");
  
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
  while(args != NULL && args->type == 0) {
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
  while(args != NULL && args->type == 0) {
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
  while(args != NULL && args->type == 0) {
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
  while(args != NULL && args->type == 0) {
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

  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_adc_regs(struct scpi_parser_context* context, struct scpi_token* command) {
  enum AD7176_registers regNr;
  for(regNr = Status_Register; regNr <= Gain_3; ++regNr) {
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
  while(args != NULL && args->type == 0) {
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
  while(args != NULL && args->type == 0) {
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
  while(args != NULL && args->type == 0) {
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
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  pvalue = atof(args->value);

  if (whichpid == 2){
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
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2){
    Serial1.print("PID:VEL:KP ");
    Serial1.println(velpid.kP);
  } else {
    Serial1.print("PID:POS:KP ");
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
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  ivalue = atof(args->value);

  if (whichpid == 2){
    velpid.kI = ivalue;
    Serial1.print("PID:VEL:KI ");
  } else {
    pospid.kI = ivalue;
    Serial1.print("PID:POS:KI ");
  }
  Serial1.println(ivalue);

  
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_ki(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2){
    Serial1.print("PID:VEL:KI ");
    Serial1.println(velpid.kI);
  } else {
    Serial1.print("PID:POS:KI ");
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
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  dvalue = atof(args->value);

  if (whichpid == 2){
    velpid.kD = dvalue;
    Serial1.print("PID:VEL:KD ");
  } else {
    pospid.kD = dvalue;
    Serial1.print("PID:POS:KD ");
  }
  Serial1.println(dvalue);

  
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_kd(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2){
    Serial1.print("PID:VEL:KD ");
    Serial1.println(velpid.kD);
  } else {
    Serial1.print("PID:POS:KD ");
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
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  svalue = atol(args->value);

  if (whichpid == 2){
    velpid.setpoint = svalue;
    Serial1.print("PID:VEL:SP ");
  } else {
    pospid.setpoint = svalue;
    Serial1.print("PID:POS:SP ");
  }
  Serial1.println(svalue);

  
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_setpoint(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2){
    Serial1.print("PID:VEL:SP ");
    Serial1.println(velpid.setpoint);
  } else {
    Serial1.print("PID:POS:SP ");
    Serial1.println(pospid.setpoint);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

scpi_error_t get_pid_cv(struct scpi_parser_context* context, struct scpi_token* command) {
  struct scpi_token* args;
  uint8_t whichpid = 1;

  args = command;
  while(args != NULL && args->type == 0) {
    if (strncasecmp(args->value, "VEL", 3) == 0 || strncasecmp(args->value, "VELOCITY", 8) == 0 ){
      whichpid = 2;
    }
    args = args->next;
  }
  if (whichpid == 2){
    Serial1.print("PID:VEL:CV ");
    Serial1.println(velpid.cv);
  } else {
    Serial1.print("PID:POS:CV ");
    Serial1.println(pospid.cv);
  }
  scpi_free_tokens(command);
  return SCPI_SUCCESS;
}

