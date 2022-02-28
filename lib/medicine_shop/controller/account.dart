class Account {
  int? id;
  final String name;
  final String date;
  final double price;
  final int quantity;
  final double amount;

  Account({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.amount,
    required this.date,
  });

  Account.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        date = map['date'],
        price = map['price'],
        quantity = map['quantity'],
        amount = map['amount'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'price': price,
      'quantity': quantity,
      'amount': amount,
    };
  }

  @override
  String toString() {
    return 'Account{id: , name: $name, date: $date, price: $price, quantity: $quantity, amouont: $amount';
  }
}
