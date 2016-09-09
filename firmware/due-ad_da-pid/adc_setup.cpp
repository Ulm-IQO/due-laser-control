
#include "adc_setup.h"

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
    {0x11, 0x8043l, 2, "Ch_Map_1 "}, //CH_Map_2
    {0x12, 0x0000l, 2, "Ch_Map_2 "}, //CH_Map_3
    {0x13, 0x0000l, 2, "Ch_Map_3 "}, //CH_Map_4
    {0x20, 0x0020l, 2, "SetupCfg0"}, //Setup_Config_1
    {0x21, 0x0020l, 2, "SetupCfg1"}, //Setup_Config_2
    {0x22, 0x0020l, 2, "SetupCfg2"}, //Setup_Config_3
    {0x23, 0x0020l, 2, "SetupCfg3"}, //Setup_Config_4
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
