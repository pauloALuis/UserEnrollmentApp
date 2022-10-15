import 'package:flutter/material.dart';
class User {
  final String id;
  final String email;
  final String name;
  final String avatarUrl;

  const User(this.id,  this.name,this.email,   this.avatarUrl);

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, avatarUrl: $avatarUrl}';
  }
}