({
	getAllOps : function(component, event, helper) {
        component.display();
		helper.serverMethodCall(component,
                               "c.getAllOpportunities",
                               "v.oppList");
        
	},
 
    getWonOps : function(component, event, helper) {
		
	},
    
    displayToast :function(component,event,helper) {
    //1.get refernce
    var toastEvent = $A.get("e.force:showToast");
     if(toastEvent)
    {
    //2.setParams
    toastEvent.setParams({
        "type":"success",
    "title":"SuccessMessage",
    "message":"Opportunities are getting loaded..."});
  toastEvent.fire();
}
else
{
    alert("Opportunities are getting loaded...");
}
     
    },
    showSpinner:function(component,event,helper){
        //Get refernce to spinner
        var spin = component.find("spin");
        //remove slds-hide
        $A.util.removeClass(spin,"slds-hide");
    },
    hideSpinner:function(component,event,helper){
        //Get refernce to spinner
        var spin = component.find("spin");
        //remove slds-hide
        $A.util.addClass(spin,"slds-hide");
    },
    
})