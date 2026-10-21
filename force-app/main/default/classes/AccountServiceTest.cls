@IsTest
private class AccountServiceTest {

    @IsTest
    static void testCreateAccount() {
        Account acc = AccountService.createAccount(
            'QA Test Account'
        );

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

        Account result = AccountService.getAccount(acc.Id);

        System.assertEquals(
            acc.Id,
            result.Id,
            'Account ID should match'
        );

        System.assertEquals(
            'Existing QA Account',
            result.Name,
            'Account name should match'
        );
    }

    @IsTest
    static void testUpdateAccountPhone() {
        Account acc = new Account(
            Name = 'QA Phone Update Test',
            Phone = '1111111111'
        );
        insert acc;

        Test.startTest();

        Account updatedAccount =
            AccountService.updateAccountPhone(
                acc.Id,
                '9876543210'
            );

        Test.stopTest();

        System.assertEquals(
            acc.Id,
            updatedAccount.Id,
            'Account ID should remain the same'
        );

        System.assertEquals(
            '9876543210',
            updatedAccount.Phone,
            'Account phone should be updated successfully'
        );

        Account savedAccount = [
            SELECT Phone
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals(
            '9876543210',
            savedAccount.Phone,
            'Updated phone should be saved in the database'
        );
    }
}