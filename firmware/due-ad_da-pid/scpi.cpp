
#include "scpi.h"

void setup_scpi_command_tree(struct scpi_parser_context *ctx) {
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

  struct scpi_command *source, *measure, *pidcmd, *velcmd, *poscmd;

  /* First, initialise the parser. */
  scpi_init(ctx);
  
  scpi_register_command(ctx->command_tree, SCPI_CL_SAMELEVEL, "*IDN?", 5, "*IDN?", 5, identify);
  source = scpi_register_command(ctx->command_tree, SCPI_CL_CHILD, "SOURCE", 6, "SOUR", 4, NULL);

  scpi_register_command(source, SCPI_CL_CHILD, "RESET", 5, "RE", 2, reset_voltage);
  scpi_register_command(source, SCPI_CL_CHILD, "VOLTAGE", 7, "VOLT", 4, set_voltage);
  scpi_register_command(source, SCPI_CL_CHILD, "VOLTAGE?", 8, "VOLT?", 5, get_voltage);
  
  scpi_register_command(source, SCPI_CL_CHILD, "RAMP?", 5, "R?", 2, get_rampdirection);
  scpi_register_command(source, SCPI_CL_CHILD, "RAMP", 4, "R", 1, set_rampdirection);
  
  scpi_register_command(source, SCPI_CL_CHILD, "RAMPSPEED?", 10, "RS?", 3, get_rampspeed);
  scpi_register_command(source, SCPI_CL_CHILD, "RAMPSPEED", 9, "RS", 2, set_rampspeed);

  scpi_register_command(source, SCPI_CL_CHILD, "RAMPLIMITS?", 11, "RL?", 3, get_ramplimits);
  scpi_register_command(source, SCPI_CL_CHILD, "RAMPLIMITS", 10, "RL", 2, set_ramplimits);

  measure = scpi_register_command(ctx->command_tree, SCPI_CL_CHILD, "MEASURE", 7, "MEAS", 4, NULL);
  scpi_register_command(measure, SCPI_CL_CHILD, "VALUE?", 6, "VAL?", 4, get_adc_value);
  scpi_register_command(measure, SCPI_CL_CHILD, "REGISTERS?", 10, "REG?", 4, get_adc_regs);
  scpi_register_command(measure, SCPI_CL_CHILD, "REGISTER", 8, "REG", 3, set_adc_reg);
  scpi_register_command(measure, SCPI_CL_CHILD, "INITIALIZE", 10, "INIT", 4, adc_init);

  pidcmd = scpi_register_command(ctx->command_tree, SCPI_CL_CHILD, "PID", 3, "PID", 3, NULL);
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
}
