class BankAcc {
  final int _accId;
  final String _accOwner;
  double _balance;
  BankAcc({required int accId,required String accOwner,double initialBalance = 0,
  }) 
   : _accId = accId,
        _accOwner = accOwner,
        _balance = initialBalance;

  double get balance => _balance;
  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception("Insufficient funds! Cannot withdraw \$${amount}");
    }
    _balance -= amount;
  }
  void credit(double amount) {
    _balance += amount;
  }
  int get accId => _accId;
  String get accOwner => _accOwner;
}
class Bank {
  final List<BankAcc> _accs = [];
  BankAcc createAcc(int accId, String accOwner) {
    for (BankAcc acc in _accs) {
      if (acc.accId == accId) {
        throw Exception("Account ID already exists.");
      }
    }
    BankAcc newAcc = BankAcc(accId: accId, accOwner: accOwner);
    _accs.add(newAcc);
    return newAcc;
  }
  BankAcc? getAccById(int accId) {
    for (BankAcc acc in _accs) {
      if (acc.accId == accId) {
        return acc;
      }
    }
    return null;
  }
  int getTotalAccs() {
    return _accs.length;
  }
}
void main() {
  Bank bank = Bank();
  BankAcc acc1 = bank.createAcc(101, "Avyna Sen");
  BankAcc acc2 = bank.createAcc(102, "Jastin Jen");
  acc1.credit(1000);  
  acc1.withdraw(500); 
  print("Account 1 balance: \$${acc1.balance}");
  print("Total accounts: ${bank.getTotalAccs()}");
}