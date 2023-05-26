({
	handleEvent : function(component, event, helper) {
        //1. get value from event attribute using 
        // event.getparam
        // event attributes will not have v notation
        var msg = event.getParam("AccName")
        //2.Take action
        alert("Received message from notifier"+msg);
        helper.serverMethodCall(component,
                               "c.searchAccounts",
                                "v.accList",{"searchString":msg});
		
	},
    getContacts: function(component, event, helper) {
        //1. get value from event attribute using 
        // event.getparam
        // event attributes will not have v notation
        var msg = event.getParam("AccName")
        //2.Take action
        alert("Received message from notifier"+msg);
        helper.serverMethodCall(component,
                               "c.getContactsForGiventAccount",
                                "v.conList",{"accID":msg});
		
	}
})