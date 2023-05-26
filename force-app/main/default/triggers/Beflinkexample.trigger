trigger Beflinkexample on Account (before insert) {

    account ac  =  trigger.new[0];
    
        contact c = new contact();
            c.LastName = ac.Name;
            c.AccountId = ac.id;    // Contain NULL value
        insert c;
       
        opportunity o = new opportunity();
            o.Name = ac.name;
            o.AccountId = ac.id;
            o.StageName = 'qualification';
            o.CloseDate =system.today();
        insert o;
        

}