public class NumberOfContactsTriggerHandler{
    
    public static Set <Id> accountIds = new Set<Id>();
    public Static Set<Id> oldAccIds = new Set<Id>();
    public static List<id> conIds = new List<id>();
    public static List<Account> accountList = new List<Account>(); 
    
    
    public static void onAfterInsert(List<contact> contacts){
        for(Contact con:contacts)
        {
            if(con.AccountId != Null)
            {
                accountIds.add(con.AccountId);
                conIds.add(con.Id);
            }
        }
        accountList = getAcocuntDetails(accountIds, conIds);
        updateNumberOfContactLinked(accountList);
    }
    
    public static void onAfterDelete(List<contact> contacts){
        for(contact con:contacts)
        {
            if(con.AccountId != Null)
            {
                accountIds.add(con.AccountId);
                conIds.add(con.Id);
            }
        }
        accountList = getAcocuntDetails(accountIds, conIds);
        updateNumberOfContactLinked(accountList);
    }
    
    public static void onAfterUpdate(List<contact> contacts){    
        for(contact con:contacts)
        {
            system.debug('jjjhhhh'+((contact)trigger.oldMap.get(con.Id)).accountId);
            contact oldcon = ((contact)trigger.oldMap.get(con.Id));
            system.debug('**'+oldcon.AccountId);
            
            if(con.AccountId != Null && oldcon.AccountId != null && con.AccountId != oldcon.AccountId  )
            {
                accountIds.add(con.AccountId);
                oldAccIds.add(oldcon.AccountId);
                conIds.add(con.Id);
            }
        }
        if(accountIds!=Null && conIds !=Null )
        {
            accountList = getAcocuntDetails(accountIds, conIds);
            updateNumberOfContactLinked(accountList);
        }
        if(oldAccIds!=Null)
        {
            accountList = [SELECT ID,Number_of_Contacts__c,(SELECT ID FROM Contacts) contacts FROM Account where id in :oldAccIds];
           for (Account act : accountList) {
            Integer contactSize = 0;
            System.debug('acclist' + accountList);
             System.debug('Contacts from Trigger.new' + act.contacts);
              System.debug('act' + act);
                if(act.Number_of_Contacts__c != null) 
                {
                    act.Number_of_Contacts__c =act.contacts.size();
                }
                
            }
          update accountList;
        }
    }
    
    
    public static List<Account> getAcocuntDetails(set<id> accountSet, List<id> contactList ) {
        return [SELECT ID,Number_of_Contacts__c,(SELECT ID FROM Contacts where id IN :contactList) contacts FROM Account where id in :accountSet];
    }
    
    
    
    public static void updateNumberOfContactLinked(List<Account> accList) {
        List<Account> accountList = new List<Account>();
        for (Account act : accList) {
            Integer contactSize = 0;
            System.debug('acclist' + acclist);
            
            if ((trigger.isInsert)) {
                System.debug('acclist' + acclist);
                System.debug('Contacts from Trigger.new' + act.contacts);
                contactSize += act.contacts.size();
                System.debug('act' + act);
                if(act.Number_of_Contacts__c == null) 
                {
                    Account acc =  [SELECT ID, (SELECT ID FROM Contacts) contacts FROM Account where id =: act.Id Limit 1];
                    act.Number_of_Contacts__c =acc.contacts.size();
                }
                else 
                {
                    act.Number_of_Contacts__c += contactSize ;
                }
            }
            
            if ((trigger.isUpdate)) {
               
                System.debug('acclist number of contacts' + act.Number_of_Contacts__c);  
                 if(act.Number_of_Contacts__c!= null) 
                    
                {
                    act.Number_of_Contacts__c =act.Number_of_Contacts__c + act.contacts.size();
                    System.debug('acclist modification '+ act.Number_of_Contacts__c);  
                }
                
            }
            
            if (trigger.isDelete) {
                System.debug('acclist delete' + acclist[0].contacts.size());
                contactSize += act.contacts.size();
                System.debug('acclist deleteaaa' + contactSize);
                if(act.Number_of_Contacts__c!= null) 
                {
                    System.debug('acclist number of contacts' + act.Number_of_Contacts__c);			   
                    act.Number_of_Contacts__c =act.Number_of_Contacts__c - act.contacts.size() ;
                    System.debug('acclist modification '+ act.Number_of_Contacts__c);
                }
                
            }
        }
        
        update accList;
    }
}