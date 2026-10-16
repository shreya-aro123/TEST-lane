trigger DumpItTestRecord on DumpIt_Test_Record__c (before insert) {
    for (DumpIt_Test_Record__c r : Trigger.new) {
        if (String.isBlank(r.Description__c)) r.Description__c='Created by trigger';
    }
}