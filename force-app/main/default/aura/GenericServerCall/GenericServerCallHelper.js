({
    serverMethodCall : function(component,methodName,attributeName,params) {
        //1.get Reference to server -side apex method
        //using component.get() function
         var methodRef = component.get(methodName);
        //2.check to see wheather the params has something in it,if so set it
        if(params)
        {
            methodRef.setParams(params);
        }
       
        //2.Register callback function which is called automaticallu //
        //when the server resturns response
        methodRef.setCallback(this,function(response){
            //3.check state of the response
            var responseState = response.getState();
            alert(responseState);
            if(responseState == "SUCCESS")
            {
                //4. Fetch return value from response
                var result = response.getReturnValue();
                //alert(result);
                component.set(attributeName,result);
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
    
    serverMethodCall1 : function(component,methodName,attributeName) {
        
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