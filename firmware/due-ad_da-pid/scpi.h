
#include <stdint.h>
#include <Arduino.h>
#include "libraries/ArduinoSCPIParser/scpiparser.h"

#ifndef _SCPI_H_
#define _SCPI_H_

// SCPI Parser setup
//struct scpi_parser_context ctx;

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

void setup_scpi_command_tree(struct scpi_parser_context *ctx);

#endif //_SCPI_H_
