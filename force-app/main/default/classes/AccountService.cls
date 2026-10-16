public class AccountService {

    public static Account createAccount(String accountName) {
        Account acc = new Account(Name = accountName);
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

    public static String getAccountName(Id accountId) {
        Account acc = getAccount(accountId);
        return acc.Name;
    }
     // New method added for QA testing
    public static Account updateAccountPhone(
        Id accountId,
        String phoneNumber
    ) {
        Account acc = [
            SELECT Id, Name, Phone
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        acc.Phone = phoneNumber;
        update acc;

        return acc;
    }
}