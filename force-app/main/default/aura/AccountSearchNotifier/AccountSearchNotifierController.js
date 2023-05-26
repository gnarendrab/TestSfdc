({
	accountSearch : function(component, event, helper) {
        
        var searchText = component.get("v.searchText");
        //1getrefernce to event using component.getEvent().
        
		var accSearch = component.getEvent("AccountSearchEvent");
        //2.set event attributes in json format
        //using setParams() finction
        accSearch.setParams({"AccName":searchText});
        //3.fire the event
        accSearch.fire();
		
	}
})