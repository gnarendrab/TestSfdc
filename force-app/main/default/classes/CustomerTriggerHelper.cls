//Helper class:Below code needs o be checked.
public class CustomerTriggerHelper {
    
    public static void isAfterUpdateCall(List<apex_customer__c> customerList,Map<id, apex_customer__c> newMapCustomer, Map<id, apex_customer__c> oldMapCustomer) {
        createInvoiceRecords(customerList,oldMapCustomer);//Method call
        //updateCustomerDescription(customerList);
        updateCustomerDescription(customerList,newMapCustomer);

    }

    //Method To Create Invoice Records
    public static void createInvoiceRecords (List<apex_customer__c> customerList, Map<id, apex_customer__c> oldMapCustomer) {
    List<apex_invoice__c> InvoiceList = new List<apex_invoice__c>();
        for (APEX_Customer__c objCustomer: customerList) {
            if (objCustomer.APEX_Customer_Status__c == 'Active' && oldMapCustomer.get(objCustomer.id).APEX_Customer_Status__c == 'Inactive') {//condition to check the old value and new value
                APEX_Invoice__c objInvoice = new APEX_Invoice__c();
                objInvoice.APEX_Status__c = 'Pending';
                objInvoice.APEX_Customer__c = objCustomer.id;
                InvoiceList.add(objInvoice);
            }
        }
        insert InvoiceList;//DML to insert the Invoice List in SFDC
    }

    //Method to update the invoice records
   /* public static void updateCustomerDescription (List<apex_customer__c> customerList) {
        for (APEX_Customer__c objCust: customerList) {
            List<apex_invoice__c> invList = [SELECT Id, Name, APEX_Description__c FROM APEX_Invoice__c WHERE APEX_Customer__c = :objCust.id];//This query will fire for the number of records customer list has and will hit the governor limit when records are more than 100 
            for (APEX_Invoice__c objInv: invList) {
                objInv.APEX_Description__c = 'OK To Pay';
                update objInv;//Update invoice, this will also hit the governor limit for DML if large number(150) of records are there
            }
        }
    } */
   public static void updateCustomerDescription (List<apex_customer__c> customerList,Map<id, apex_customer__c> newMapVariable) {
        List<apex_customer__c> customerListWithInvoice = [SELECT id, Name,(SELECT Id, Name, APEX_Description__c FROM UdemyInvoices__r) FROM APEX_Customer__c WHERE Id IN :newMapVariable.keySet()];//Query will be for only one time and fetches all the records
        List<apex_invoice__c> invoiceToUpdate = new List<apex_invoice__c>();
        List<Apex_invoice__c>invList=new List<apex_invoice__c>();
        invList=customerListWithInvoice[0].UdemyInvoices__r; 
        for (APEX_Customer__c objCust: customerList) {
           
            for (APEX_Invoice__c objInv: invList) {
                objInv.APEX_Description__c = 'OK To Pay';
               invoiceToUpdate.add(objInv);
            }
        }
        update invoiceToUpdate;
    } 
}