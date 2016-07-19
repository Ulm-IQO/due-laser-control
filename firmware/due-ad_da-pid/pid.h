
#include <stdint.h>

#ifndef _PID_H_
#define _PID_H_

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


void PIDstep(piddata_t* p, int32_t pv);

#endif //_PID_H_
