import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final String? image;

  const User({
    required this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toInt() as int,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'].toInt() as int?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        age,
        gender,
        email,
        phone,
        image,
      ];
}
