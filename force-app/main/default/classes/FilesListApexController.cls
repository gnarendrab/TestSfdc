public class FilesListApexController {
@AuraEnabled
    public static List<ContentVersion> getContentDocs(String arecordId)
{   
    List<ContentDocumentLink> CDLs = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :arecordId];
    if (CDLs.size() < 1) return new List<ContentVersion>(); 

    // Make a List of ContentDocument IDs
    List <Id> CDIdList = new List <Id> ();
    for (ContentDocumentLink nextCDL : CDLs) {
        CDIdList.add(nextCDL.ContentDocumentId); }        

    List<ContentVersion> entries = [SELECT Id, Title, FileType FROM ContentVersion WHERE ContentDocumentId IN :CDIdList];
    return entries;
}

}