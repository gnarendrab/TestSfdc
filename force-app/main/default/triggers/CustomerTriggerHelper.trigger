//Trigger with Context variable for controlling the calling flow
trigger CustomerTriggerHelper  on APEX_Customer__c (after update, after insert) {
    if (trigger.isAfter && trigger.isUpdate) {//This condition will check for trigger events using isAfter and isUpdate context variable
        CustomerTriggerHelper.isAfterUpdateCall(Trigger.new,Trigger.oldMap);//Trigger calls the helper class and does not have any code in Trigger and this will be called only when trigger ids after update
    }
}