@IsTest
private class AccountServiceTest {

    @IsTest
    static void testCreateAccount() {
        Test.startTest();

        Account acc = AccountService.createAccount(
            'QA Test Account'
        );

        Test.stopTest();

        System.assertNotEquals(
            null,
            acc.Id,
            'Account should be created successfully'
        );

        System.assertEquals(
            'QA Test Account',
            acc.Name,
            'Account name should match'
        );
    }

    @IsTest
    static void testGetAccount() {
        Account acc = new Account(
            Name = 'Existing QA Account'
        );
        insert acc;

        Test.startTest();

        Account result = AccountService.getAccount(acc.Id);

        Test.stopTest();

        System.assertEquals(
            acc.Id,
            result.Id,
            'The returned Account ID should match'
        );

        System.assertEquals(
            'Existing QA Account',
            result.Name,
            'The returned Account name should match'
        );
    }
}