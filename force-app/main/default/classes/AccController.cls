public class AccController {
    
    @auraEnabled
    public static List<Account> getAllAccounts()
    {
        System.debug('the changes are ');
        return [select Name,Type,Phone From Account];
    }

    @auraEnabled
    public static List<Account> getDirectAccounts()
    {
        return [select Name,Type,Phone From Account where type='Customer - Direct'];
    }

    
}