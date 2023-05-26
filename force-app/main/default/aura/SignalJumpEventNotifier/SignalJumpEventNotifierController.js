({
	informHandler : function(component, event, helper) {
		//1getrefernce to event using component.getEvent().
		var signalJump = component.getEvent("signalJump");
        //2.set event attributes in json format
        //using setParams() finction
        signalJump.setParams({"msg":"Narendra jumped signal, fine him"});
        //3.fire the event
        signalJump.fire();
    }
})