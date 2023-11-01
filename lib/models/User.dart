import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:bcrypt/bcrypt.dart';

class User extends ChangeNotifier {
  final String id;
  final String username;
  String email;
  String fullName;
  String address;
  String passwordHash; // Hashed password field\
  String phoneNumber;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.fullName,
    required this.address,
    required this.passwordHash,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      fullName: json['full_name'],
      address: json['address'],
      passwordHash: json['password_hash'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'full_name': fullName,
      'address': address,
      'password_hash': passwordHash,
      'phone_number': phoneNumber,
    };
  }

  void updateUserInfo(
      String newName, String newPhoneNumber, String newAddress) {
    fullName = newName;
    phoneNumber = newPhoneNumber;
    address = newAddress;
    notifyListeners();
  }

  void changePassword(String newPassword) {
    passwordHash = newPassword;
    notifyListeners();
  }
  // bool verifyPassword(String password) {
  //   return Bcrypt.verify(password, passwordHash);
  // }

  // static String hashPassword(String password) {
  //   return Bcrypt.hashpw(password, Bcrypt.genSalt());
  // }
}

User currentUser = User(
    id: '1 ',
    email: 'tranhoangdai2002@gmail.com',
    username: 'tranhoangdai2002@gmail.com',
    fullName: 'Hoang Dai',
    address: '123 Ly thuong kiet, da nang city',
    passwordHash: '123456789',
    phoneNumber: '0923456666');
