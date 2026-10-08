public with sharing class DumpItBasicService {
    public static DumpIt_Test_Record__c createRecord(String name) {
        DumpIt_Test_Record__c r = new DumpIt_Test_Record__c(
            Name=name, Status__c='New', Amount__c=100
        );
        insert r;
        return r;
    }
}