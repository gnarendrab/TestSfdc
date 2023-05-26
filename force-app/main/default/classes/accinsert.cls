public class accinsert {

    public string aname {set;get;}
    public string aphone {set;get;}
    public string acity {set;get;}
    
    public void m1(){

        account ac = new account();
        	ac.Name = aname;
        	ac.BillingCity = acity;
        	ac.Phone = aphone;
          
        list<account> arecs	= [select id,name from account where name = :aname];
        integer n = arecs.size();
        apexpages.Message msg1 = new apexpages.Message(
        					apexpages.Severity.CONFIRM, String.valueOf(n));
        apexpages.addMessage(msg1);
              if( arecs.size() == 0 ){
	        insert ac;
        		apexpages.Message msg2 = new apexpages.Message(
        					apexpages.Severity.CONFIRM, aname + ' Inserted Successfully..');
        apexpages.addMessage(msg2);
        }
        else {
           apexpages.Message msg3 = new apexpages.Message(
           			apexpages.Severity.ERROR, aname + ' Record already Exist ' + n + ' Times...'); 
           		apexpages.addMessage(msg3);	
        }

    }



}