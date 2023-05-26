trigger ACCTDELETETrigger on Account (before delete) {
    
    account ac = trigger.old[0];
    
    system.debug( ac.name +  ' Record deleted');
    system.debug(' Record deleted at Time :'+ system.now());
    system.debug('REcord deleted by the user '+ userinfo.getFirstName());
    
}