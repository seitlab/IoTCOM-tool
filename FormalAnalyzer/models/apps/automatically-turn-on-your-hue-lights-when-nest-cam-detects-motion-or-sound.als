module app_automatically_turn_on_your_hue_lights_when_nest_cam_detects_motion_or_sound

open IoTBottomUp as base

open cap_motionSensor
open cap_switch

lone sig app_automatically_turn_on_your_hue_lights_when_nest_cam_detects_motion_or_sound extends IoTApp {
  trigObj : one cap_motionSensor,
  switch : one cap_switch,
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
  capabilities = app_automatically_turn_on_your_hue_lights_when_nest_cam_detects_motion_or_sound.trigObj
  attribute    = cap_motionSensor_attr_motion
  value        = cap_motionSensor_attr_motion_val_active
}


abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_automatically_turn_on_your_hue_lights_when_nest_cam_detects_motion_or_sound.switch
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_on
}



