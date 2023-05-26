({
	closeModal : function(component, event, helper) {
		component.destroy();
	},
    
    add : function(component, event, helper) {
		var fn = component.get("v.one");
        var sn = component.get("v.two");
        var res= parseInt(fn)+parseInt(sn);
        alert("Additional Results:"+res);
        component.set("v.res",res);
	},
    
    mul : function(component, event, helper) {
		var fn = component.get("v.one");
        var sn = component.get("v.two");
        var res= parseInt(fn)*parseInt(sn);
        alert("Additional Results:"+res);
        component.set("v.res",res);
	}
    
})