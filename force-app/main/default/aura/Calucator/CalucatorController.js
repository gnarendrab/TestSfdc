({
	add : function(component, event, helper) {
		var fn = component.get("v.one");
        var sn = component.get("v.two");
        var res= parseInt(fn)+parseInt(sn);
        alert("Additional Results:"+res);
        component.set("v.res",res);
	},
    
    sub : function(component, event, helper) {
		
	},
    
    mult : function(component, event, helper) {
		
	},

    div : function(component, event, helper) {
		
	},
    
})