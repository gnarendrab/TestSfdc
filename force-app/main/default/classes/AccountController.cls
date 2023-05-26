public class AccountController {
@AuraEnabled
    public static List<Account> searchAccounts(string searchString)
    {
        //sosl
        List<Account> accList = [FIND : searchString 
                                RETURNING Account(Name,Type,Phone)][0];
        return accList;
    }
    
    @AuraEnabled
    public static List<Contact> getContactsForGiventAccount(String accID)
    {
        //SOQL
        return [SELECT ID,FirstName,LastName,Email FROM Contact where accountId = :accID];
    }
}