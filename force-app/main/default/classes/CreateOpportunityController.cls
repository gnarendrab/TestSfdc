public class CreateOpportunityController {
public Lead currentRecord{get; set;}

public CreateOpportunityController(ApexPages.StandardController stdController)
{
    currentRecord = [SELECT Id,Name,Phone,Company FROM Lead WHERE Id = :ApexPages.currentPage().getParameters().get('id')]; 
 }
public pagereference populateopportunityFieldsMethod()
{  
        Opportunity op= new Opportunity();
        op.Name = currentRecord.Name +'opportunity';
        op.StageName ='Prospecting';
        op.CloseDate =Date.today();
        //op.Probability=0.5;
        database.insert(op);
        Pagereference pg = new Pagereference('/'+op.Id+'/e?retURL='+op.Id);
        return pg;
}

}