({
	doinit : function(component, event, helper) {
        var action = component.get("c.showAccounts");
        $A.enqueueAction(action);
        
        action.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                var rbody = response.getReturnValue();
                component.set("v.accList",rbody);
            }
            if(response.getState()=="ERROR"){
                console.log("Error is "+response.getError());
            }
        });
    }
})