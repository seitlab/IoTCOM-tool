module app_notify_me_on_the_bmw_dashboard_about_unlock_events

open IoTBottomUp as base

open cap_lock
open cap_switch

lone sig app_notify_me_on_the_bmw_dashboard_about_unlock_events extends IoTApp {
  trigObj : one cap_lock,
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
  capabilities = app_notify_me_on_the_bmw_dashboard_about_unlock_events.trigObj
  attribute    = cap_lock_attr_lock
  value        = cap_lock_attr_lock_val_unlocked
}


abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_notify_me_on_the_bmw_dashboard_about_unlock_events.switch
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_on
}



