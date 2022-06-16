import 'dart:convert';

class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final DateTime dateCreated;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.dateCreated,
  });

  // User.fromJson(json)
  //     : id = json['id'] as int,
  //       firstname = json['firstname'] as String,
  //       lastname = json['lastname'] as String,
  //       email = json['email'] as String,
  //       phone = json['phone'] as String,
  //       dateCreated = DateTime(2022);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'dateCreated': dateCreated.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    //if(map == null) return null;
    return User(
      id: map['id'] ?? '',
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      dateCreated: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
