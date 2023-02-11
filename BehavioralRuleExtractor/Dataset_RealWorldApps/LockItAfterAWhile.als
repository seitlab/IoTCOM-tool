module app_LockItAfterAWhile

open IoTBottomUp as base
open cap_runIn
open cap_now

open cap_lock
open cap_presenceSensor


one sig app_LockItAfterAWhile extends IoTApp {
  
  lock1 : some cap_lock,
  
  presence1 : some cap_presenceSensor,
  
  state : one cap_state,
} {
  rules = r
  //capabilities = lock1 + presence1 + state
}


one sig cap_state extends cap_runIn {} {
  attributes = cap_state_attr + cap_runIn_attr
}
abstract sig cap_state_attr extends Attribute {}





abstract sig r extends Rule {}

one sig r0 extends r {}{
  no triggers
  conditions = r0_cond
  commands   = r0_comm
}




abstract sig r0_cond extends Condition {}

one sig r0_cond0 extends r0_cond {} {
  capabilities = app_LockItAfterAWhile.lock1
  attribute    = cap_lock_attr_lock
  value        = cap_lock_attr_lock_val_locked
}
one sig r0_cond1 extends r0_cond {} {
  capabilities = app_LockItAfterAWhile.state
  attribute    = cap_runIn_attr_runIn
  value        = cap_runIn_attr_runIn_val_on
}
one sig r0_cond2 extends r0_cond {} {
  capabilities = app_LockItAfterAWhile.presence1
  attribute    = cap_presenceSensor_attr_presence
  value        = cap_presenceSensor_attr_presence_val_present
}

abstract sig r0_comm extends Command {}

one sig r0_comm0 extends r0_comm {} {
  capability   = app_LockItAfterAWhile.lock1
  attribute    = cap_lock_attr_lock
  value        = cap_lock_attr_lock_val_locked
}

one sig r1 extends r {}{
  triggers   = r1_trig
  conditions = r1_cond
  commands   = r1_comm
}

abstract sig r1_trig extends Trigger {}

one sig r1_trig0 extends r1_trig {} {
  capabilities = app_LockItAfterAWhile.lock1
  attribute    = cap_lock_attr_lock
  no value
}


abstract sig r1_cond extends Condition {}


abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_LockItAfterAWhile.state
  attribute    = cap_runIn_attr_runIn
  value        = cap_runIn_attr_runIn_val_on
}



