import 'dbhelper.dart';

class Medicine {
  final int id;
  final String name;
  final String location;
  final int price;
  final int storage;

  Medicine({
    required this.id,
    required this.name,
    required this.price,
    required this.storage,
    required this.location,
  });

  Medicine.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        location = map['location'],
        price = map['price'],
        storage = map['storage'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'price': price,
      'storage': storage,
    };
  }

  @override
  String toString() {
    return 'Medicine{id: $id, name: $name, location: $location, price: $price, storage: $storage';
  }
}
