import "dart:ffi";

class BankAccount {
  final int _accountId;
  final String _accountOwner;
  double _balance;

  BankAccount({required int accountId, required String accountOwner})
      : _accountId = accountId,
        _accountOwner = accountOwner,
        _balance = 0.0;

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be greater than zero!');
    }
    _balance += amount;
    print('Credited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdrawal amount must be greater than zero!');
    }
    if (_balance < amount) {
      throw Exception('Insufficient funds! Current balance: \$${_balance.toStringAsFixed(2)}');
    }
    _balance -= amount;
    print('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
  }
}
 

class Bank {
  final String _bankName;
  final Map<int, BankAccount> _accounts;

  Bank({required String bankName}) : _bankName = bankName, _accounts = {};

  String get bankName => _bankName;

  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }
    BankAccount newAccount = BankAccount(accountId: accountId, accountOwner: accountOwner);
    _accounts[accountId] = newAccount;
    print('Created account for $accountOwner with ID $accountId');
    return newAccount;
  }

  BankAccount getAccount(int accountId) {
    if (!_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId does not exist!');
    }
    return _accounts[accountId]!;
  }
}

void main() {
  Bank myBank = Bank(bankName: 'CADT Bank');

  BankAccount ronanAccount = myBank.createAccount(101, 'Ronan');

  print('Initial Balance: \$${ronanAccount.balance.toStringAsFixed(2)}');
  ronanAccount.credit(500);
  ronanAccount.withdraw(200);

  try {
    myBank.createAccount(101, 'Sokea');
  } catch (e) {
    print(e);
  }

  try {
    ronanAccount.withdraw(400);
  } catch (e) {
    print(e);
  }
}

