public class AccountService {

    public static Account createAccount(String accountName) {
        Account acc = new Account(
            Name = accountName
        );

        insert acc;
        return acc;
    }

    public static Account getAccount(Id accountId) {
        return [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];
    }
}