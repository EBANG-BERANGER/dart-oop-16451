class BusCard {
  String _owner = '';
  int _balance = 0;
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }
  String get owner {
    return _owner;
  }

  // TODO 1: write a getter for balance
  int get balance {
    return _balance;
  }
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: write a method topUp(int amount)
 
  void topUp(int amount) {
    if (amount < 500 || amount > 50000) {
      print('Error: top-up must be 500 to 50000 RWF');
    } else {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    }
  }

  // TODO 3: write a method pay(int fare)
 
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  @override
  void showInfo() {
    super.showInfo(); 
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay(int fare)
 
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  BusCard card = BusCard('Ama', 1510);
  card.owner = 'Al'; 
  card.showInfo();

  // TODO 5: change the owner to your full name, then call showInfo()
  card.owner = 'Engonga Ebang Achille Beranger';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay your bus fare 2 times, then call showInfo()
  card.pay(251);
  card.pay(251);
  card.showInfo();

  // TODO 8: create a StudentCard with your name, starting balance and discount
  StudentCard studentCard = StudentCard('Engonga Ebang Achille Beranger', 1510, 11);

  // TODO 9: pay your bus fare with the student card, then call showInfo()
  studentCard.pay(251);
  studentCard.showInfo();
}
