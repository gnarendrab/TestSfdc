trigger ACCUpdateTrigger on Account (before update) {
   Account acct   =  Trigger.new[0];
   Account acct1  =  Trigger.old[0];
   if(acct.name == acct1.Name)
   {
       acct.addError('Old and New Names can not be Similar');
   }
}