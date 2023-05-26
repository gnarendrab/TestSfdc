trigger ATIns on Account (before insert) {
    
   Account acc= trigger.new[0];
   acc.Name='sfdc'+acc.Name;
   if(acc.BillingCity =='Hyderabad') 
   {
       acc.BillingCity='Hyd';
   }
    
  
}