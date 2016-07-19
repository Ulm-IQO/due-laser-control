
#include "pid.h"

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

