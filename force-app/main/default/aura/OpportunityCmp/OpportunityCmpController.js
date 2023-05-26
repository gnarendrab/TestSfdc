({
	getAllOps : function(component, event, helper) {
		//1.get Reference to server -side apex method
		//using component.get() function
		
        var methodRef = component.get("c.getAllOpportunities");
        //3.Register callback function which is called automaticallu //
        //when the server resturns response
        methodRef.setCallback(this,function(response){
            //4.check state of the response
            var responseState = response.getState();
            alert(responseState);
            if(responseState == "SUCCESS")
            {
                //2. Fetch return value from response
                var result = response.getReturnValue();
                //alert(result);
                component.set("v.oppList",result);
            }else
            {
                alert("problem in server side method call")
            }
            
        });
        //5. Put method call in queue so that server can excute  this method
        //as per covenience and return result
        //use $A.enqueueAction() function to do the the same
        $A.enqueueAction(methodRef);
        
	},
 
    
	getWonOps : function(component, event, helper) {
		//1.get Reference to server -side apex method
		//using component.get() function
		
        var methodRef = component.get("c.getWonOpportunities");
        //3.Register callback function which is called automaticallu //
        //when the server resturns response
        methodRef.setCallback(this,function(response){
            //4.check state of the response
            var responseState = response.getState();
            alert(responseState);
            if(responseState == "SUCCESS")
            {
                //2. Fetch return value from response
                var result = response.getReturnValue();
                //alert(result);
                component.set("v.wonList",result);
            }else
            {
                alert("problem in server side method call")
            }
            
        });
        //5. Put method call in queue so that server can excute  this method
        //as per covenience and return result
        //use $A.enqueueAction() function to do the the same
        $A.enqueueAction(methodRef);
        
	}
 
    
})