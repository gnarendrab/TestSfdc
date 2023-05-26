public class AccountRetervial {

    public string aname {set;get;}
    public list<account> accrecs {set;get;}
    public list<lead> leadrecs {set;get;}
    public list<EMP__c> emprecs {set;get;}
    
    public AccountRetervial()
    {
    
        accrecs = [select id,name,phone,billingcity 
                 from account
                 where name = :aname];
        
        leadrecs = [select id,firstname,lastname,phone,company,city from lead 
                 where firstname = :aname];
        
         emprecs = [select id,name,FirstName__c,Desg__c,Salary__c from EMP__c 
                  where FirstName__c = :aname];
         show();
    }
    
 public void m1(){
        
        accrecs = [select id,name,phone,billingcity 
                 from account
                 where name = :aname];
        
        leadrecs = [select id,firstname,lastname,phone,company,city from lead 
                 where firstname = :aname];
        
         emprecs = [select id,name,FirstName__c,Desg__c,Salary__c from EMP__c 
                  where FirstName__c = :aname];
         show();
    }
    
      public void show(){
        
       		 string str = accrecs.size() + ' Account Records ' +
          		          leadrecs.size() + ' Lead Records Found ....' +
        		          emprecs.size() + ' Emp Records Found ....';
        
    	apexpages.Message msg = new apexpages.Message(apexpages.Severity.CONFIRM,str);
		apexpages.addMessage(msg);

    }

}