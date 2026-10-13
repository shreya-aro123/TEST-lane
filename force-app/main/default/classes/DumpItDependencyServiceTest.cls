@IsTest
private class DumpItDependencyServiceTest {
    @IsTest static void triggerSetsDefaults() {
        DumpIt_Dependency_Project__c rec = new DumpIt_Dependency_Project__c(Name='Dependency Test', Amount__c=15000);
        Test.startTest(); insert rec; Test.stopTest();
        rec = [SELECT Status__c, Owner_Code__c FROM DumpIt_Dependency_Project__c WHERE Id=:rec.Id];
        System.assertEquals('New', rec.Status__c);
        System.assertEquals('HIGH-VALUE', rec.Owner_Code__c);
    }
}