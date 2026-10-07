@IsTest
private class DumpItBasicServiceTest {
    @IsTest static void testCreateRecord() {
        Test.startTest();
        DumpIt_Test_Record__c r=DumpItBasicService.createRecord('DumpIt Test');
        Test.stopTest();
        System.assertEquals('New',r.Status__c);
        System.assertEquals(100,r.Amount__c);
    }
}