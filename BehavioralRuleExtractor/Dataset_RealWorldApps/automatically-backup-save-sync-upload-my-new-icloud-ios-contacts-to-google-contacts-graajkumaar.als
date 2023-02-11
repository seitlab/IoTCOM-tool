module app_automatically_backup_save_sync_upload_my_new_icloud_ios_contacts_to_google_contacts_graajkumaar

open IoTBottomUp as base

open cap_switch

lone sig app_automatically_backup_save_sync_upload_my_new_icloud_ios_contacts_to_google_contacts_graajkumaar extends IoTApp {
  trigObj : one cap_switch,
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
  capabilities = app_automatically_backup_save_sync_upload_my_new_icloud_ios_contacts_to_google_contacts_graajkumaar.trigObj
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_on
}


abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_automatically_backup_save_sync_upload_my_new_icloud_ios_contacts_to_google_contacts_graajkumaar.switch
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_on
}



