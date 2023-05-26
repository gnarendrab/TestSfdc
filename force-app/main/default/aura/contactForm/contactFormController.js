({
	save : function(component, event, helper) {
		//Get reference to attribute 'cont'
		var con = component.get("v.con");
        //call Server-side method by passing con as argument 
        //pass value to method in JSON format {key:value}
        //where key is parameter and value as argument
        helper.serverMethodCall(component,"c.createContact","v.status",{"cont":con});
	},
    validateLastName :function (component,event,helper){
        //Get refernece to attribute 'con'
        var con = component.get("v.con");
        //get refernce of save button
        var btn = component.find("btn");
        //check whether lastname 's length is at least 2 chars
        //if so, make disabled false - save button
        if(con.LastName.length>=2)
        {
           btn.set("v.disabled",false);
    }
    }
    })