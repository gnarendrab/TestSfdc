trigger ContactCountTrigger  on Contact (After insert, Before Delete, After Undelete, After Update) {

if((trigger.isInsert || trigger.isUndelete) && trigger.isAfter)
{
  NumberOfContactsTriggerHandler.onAfterInsert(Trigger.new);
}

if(trigger.isDelete)
{    
  NumberOfContactsTriggerHandler.onAfterDelete(Trigger.old);
}

if(trigger.isUpdate)
{
    NumberOfContactsTriggerHandler.onAfterUpdate(Trigger.new);
}
}