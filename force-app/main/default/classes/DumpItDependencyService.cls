public with sharing class DumpItDependencyService {
    public static void prepareProjects(List<DumpIt_Dependency_Project__c> records) {
        for (DumpIt_Dependency_Project__c rec : records) {
            if (String.isBlank(rec.Status__c)) rec.Status__c = 'New';
            if (rec.Amount__c != null && rec.Amount__c >= 10000 && String.isBlank(rec.Owner_Code__c)) rec.Owner_Code__c = 'HIGH-VALUE';
        }
    }
}