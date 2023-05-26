trigger Beforeafterexample on Account (before insert, after insert) {

       account ac = trigger.new[0];
    
    if(trigger.isbefore)    {
        
        System.debug('......I am in before ........');
        system.debug('ac id = ' + ac.id);
        system.debug('Name = ' + ac.name);
      
        system.debug('Trigger Id = ' + trigger.new[0].id);
        system.debug('Name= '+ trigger.new[0].name);
    }
   
     if(trigger.isAfter)    {
                
        System.debug('......I am in after ........');
        system.debug('ac id = ' + ac.id);
        system.debug('Name = ' + ac.name);
      
        system.debug('Trigger Id = ' + trigger.new[0].id);
        system.debug('Name= '+ trigger.new[0].name);
    }
  

}