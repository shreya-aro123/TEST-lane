@IsTest
private class AccountPhoneServiceTest {

    @IsTest
    static void testGetFormattedPhone() {
        Account acc = new Account(
            Name = 'QA Phone Test',
            Phone = '9876543210'
        );
        insert acc;

        Test.startTest();
        String result =
            AccountPhoneService.getFormattedPhone(acc.Id);
        Test.stopTest();

        System.assertEquals(
            'Phone: 9876543210',
            result,
            'Formatted phone should match'
        );
    }

    @IsTest
    static void testPhoneNotAvailable() {
        Account acc = new Account(
            Name = 'QA No Phone Test'
        );
        insert acc;

        Test.startTest();
        String result =
            AccountPhoneService.getFormattedPhone(acc.Id);
        Test.stopTest();

        System.assertEquals(
            'Phone not available',
            result,
            'Missing phone should return the default message'
        );
    }
}