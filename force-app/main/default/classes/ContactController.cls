public class ContactController {

    @AuraEnabled
    public static String createContact(contact cont)
    {
        try
        {
           insert cont;
            return 'contact created successfully....';
        }
        catch(DmlException ex) {
            return 'contact could not be crated';
        }
        
        
    }
}