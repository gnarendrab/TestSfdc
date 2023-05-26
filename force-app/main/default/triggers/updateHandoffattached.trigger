trigger updateHandoffattached on Top_X_Designation__c (after insert) {
   
    Map<Top_X_Designation__c,Id> maptop= new Map<Top_X_Designation__c,Id>();
    Set<Opportunity> oppid = new Set<Opportunity>();
    Map<Top_X_Designation__c,Id> maptopfalse = new Map<Top_X_Designation__c,Id>();//faslecase map
    Set<Opportunity> oppIdInFalseCase = new Set<Opportunity>();//falsecase set
    
    if(trigger.isInsert)
    {
    for (Top_X_Designation__c desg :trigger.new)
    {
      if((desg.Type__c == 'Contract Flow Down' ||desg.Type__c == 'Handoff') && desg.Document_Attached__c == TRUE) 
      {
          
      }
    }
    }

}