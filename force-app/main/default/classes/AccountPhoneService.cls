public class AccountPhoneService {

    public static String getFormattedPhone(Id accountId) {
        Account acc = [
            SELECT Id, Phone
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        if (String.isBlank(acc.Phone)) {
            return 'Phone not available';
        }

        return 'Phone: ' + acc.Phone;
    }
}