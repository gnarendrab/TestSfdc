({
	dial911 : function(component, event, helper) {
        //1.Get reference of event using $A.get
        //argument:specify actual event name along with namespace
        //application events  will be referred via e.namespace
        //example,e.c:
        //e.force:
        var emergencyEvent = $A.get("c:EmergencyEvent");
        //2.setParams
        emergencyEvent.setParams({"msg":"house on fire ,please help"});
        //3.fire
        emergencyEvent.fire();
	}
})