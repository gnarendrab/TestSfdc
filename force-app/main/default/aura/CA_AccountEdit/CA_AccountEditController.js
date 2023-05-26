({
    navigateToLC : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        var isConsoleNavigation ;
        var tst = 'true';
       if(!$A.util.isEmpty(tst)){            
            workspaceAPI.isConsoleNavigation().then(function(response) {
                isConsoleNavigation = response;
            }).then(function(response) {
                    workspaceAPI.openSubtab({
                        pageReference: {
                            type: 'standard__component',
                            attributes: {
                                componentName: 'c__TabComponent1'
                            },
                            state: {
                                c__refRecordId: component.get("v.recordId")
                            }
                        },
                        focus: true
                    }).then(function(response) {
                        workspaceAPI.setTabLabel({tabId: response,label: 'Task Edit'});
                    })
                    $A.get("e.force:closeQuickAction").fire();
                }).catch(function(error) {
                    this.displayToast('ERROR',error,'error');
                });
        }
        else{
            alert('error');
        }    
    }
})