import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

String jsonString = '{"name": "ih", "email": "ih.zonaid@gmail.com"}';
Map<String, dynamic> userMap = jsonDecode(jsonString);
var user = User.fromJson(userMap);

void call() {
  print('Howdy, ${user.name}!');
  print('We sent the verification link to ${user.email}.');
}
