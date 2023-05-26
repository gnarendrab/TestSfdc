({
	displayRecord : function(component, event, helper) {
        //Fetch sid
        alert("gggggggggg");
        var sid = component.get("v.sid");
        var eventRef = $A.get("e.force:navigateToSObject");
        if(eventRef)
        {
            eventRef.setParams({"recordId":sid});
            eventRef.fire();
        }
        else
        {alert("Please use LEx or salesforce1 mobile app");
               }
	},
    editRecord : function(component, event, helper) {
		//Fetch sid
        var sid = component.get("v.sid");
        var eventRef = $A.get("e.force:editRecord");
        if(eventRef)
        {
            eventRef.setParams({"recordId":sid});
            eventRef.fire();
        }
        else
        {
            alert("Please use LEx or salesforce1 mobile app");
        }
	}
})