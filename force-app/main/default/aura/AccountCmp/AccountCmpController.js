({
	getAllAccs : function(component, event, helper) {
		helper.serverMethodCall(component,
                               "c.getAllAccounts",
                               "v.accList");
	},
    
    getDirAccs : function(component,event,helper)
    {
        
    }
})