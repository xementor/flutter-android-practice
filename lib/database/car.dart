import 'dbhelper.dart';

class Car {
  final int id;
  final String name;
  final int miles;

  Car({required this.id, required this.name, required this.miles});

  Car.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        miles = map['miles'];

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnMiles: miles,
    };
  }
}
