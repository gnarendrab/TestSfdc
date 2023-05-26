public class FetchOppRecords {

    @AuraEnabled
    public static List<Opportunity> getAllOpportunities()
    {
        return [SELECT Name,StageName,Amount From Opportunity];
    }
    
    @AuraEnabled
    public static List<Opportunity> getWonOpportunities()
    {
        return [SELECT Name,StageName,Amount 
                From Opportunity where StageName='Closed Won'];
    }
}