({
    handleUploadFinished : function(component, event, helper) {
         alert("Hi111");
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "File "+uploadedFiles[0].name+" Uploaded successfully."
        });
        
        
    },
    handleContentDocument:function(component, event, helper) {
        alert("Hi"+component.get("v.recordId"));
        
        var action = component.get("c.getContentDocs");
        action.setParams({ "arecordId" : component.get("v.recordId")});
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
                  component.set("v.ContVersion",response.getReturnValue()); 
                  console.log("#######"+JSON.stringify(response.getReturnValue()));    
                 
            } 
            
        });
        $A.enqueueAction(action);
    
    },
    
    
showDetail: function(component, event, helper) {
     var id = event.currentTarget.dataset.id;
     alert("index"+id);
   
 }
 
    
   
    
    
    
    
})