public class loginValidation {
    public string uid {set;get;}
    public string pwd {set;get;}
    public string res {set;get;}
    
    public void m1(){
        
        if(uid == 'bhaskar' && pwd == 'cloud')
        {
            res = 'VALID User';
           String  msg= uid +' is valid  user' ;
          apexpages.addMessage(new apexpages.Message(apexpages.Severity.CONFIRM,msg));
            
        }
        else
        {
            res = 'INvalid User';
            apexpages.Message msg = new apexpages.Message(apexpages.Severity.ERROR,'INValid User');
            apexpages.addMessage(msg);
        }
        
    }    
    public void mc(){
		uid = '';
        		pwd = '';
        		res = '';
        

    }

}