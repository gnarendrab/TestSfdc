trigger Aftlinkexample on Account (after insert) {
    
    account ac =    trigger.new[0];
    
	contact c = new contact();
   		 c.LastName = ac.name;
   		 c.Phone = ac.phone;
   		 c.AccountId= ac.id;
	insert c;
    
    
	opportunity o = new opportunity();
   		 o.Name = ac.name;
   		 o.CloseDate = system.today();
   		 o.StageName = 'Qualification';
   	 	o.AccountId = ac.id;
	insert o;

}