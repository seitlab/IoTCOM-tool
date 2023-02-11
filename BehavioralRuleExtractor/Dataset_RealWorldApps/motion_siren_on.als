module app_motion_siren_on

open IoTBottomUp as base

open cap_alarm
open cap_motionSensor

one sig app_motion_siren_on extends IoTApp {
  trigObj : one cap_motionSensor,
  alarm : one cap_alarm,
} {
  rules = r
}


// application rules base class

abstract sig r extends Rule {}

one sig r1 extends r {}{
  triggers   = r1_trig
  no conditions 
  commands   = r1_comm
}

abstract sig r1_trig extends Trigger {}

one sig r1_trig0 extends r1_trig {} {
  capabilities = app_motion_siren_on.trigObj
  attribute    = cap_motionSensor_attr_motion
  value        = cap_motionSensor_attr_motion_val_active
}


abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_motion_siren_on.alarm
  attribute    = cap_alarm_attr_alarm
  value        = cap_alarm_attr_alarm_val_siren
}



