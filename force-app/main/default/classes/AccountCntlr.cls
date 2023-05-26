public class AccountCntlr {

	@AuraEnabled
    public static List<Account> showAccounts(){
        List<Account> accList = [select id,name,type,Industry,AnnualRevenue from Account limit 50];
        return accList;
    }
}