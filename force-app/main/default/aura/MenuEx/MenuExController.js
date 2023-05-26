({
	handleMenuSelect: function(component, event, helper) {
    var selectedMenuItemValue = event.getParam("value");
    //alert("Currently"+selectedMenuItemValue+"feature is not aviable");
        //create instance of ModalDialog Component
        //using $A.createComponent() function
        //arguments
        //1.Name of the componet along with the namespace
        //2.Attributes,if any,in json format
        //3.Javascript function which will take ModalDialog
        //instance reference as parameter
        $A.createComponent("c:ModalExample",
                           {"title":"Message",
                            "body":"this featutre is not availble"},
                           function(myBox){
                                    //1.Get Reference to div
                                    var modalDiv = component.find("modalDiv");
                                    //2.Get a copy of the Div's body
                                    var modalDivBody = modalDiv.get("v.body");
                                    // push myBox inside copy of this body
                                    modalDivBody.push(myBox);
                                    //set copy of div's body back to div
                                    modalDiv.set("v.body",modalDivBody);
                                    });
    }
})