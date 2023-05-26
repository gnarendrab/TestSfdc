({
	handleEvent : function(component, event, helper) {
        //1. get value from event attribute using 
        // event.getparam
        // event attributes will not have v notation
        var msg = event.getParam("msg")
        //2.Take action
        alert("Received message from notifier"+msg);
		
	}
})