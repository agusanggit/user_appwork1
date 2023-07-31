import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserViewModel extends ChangeNotifier {
final String baseUrl = 'https://capekngoding.com/628995233225/api';
List<UserModel>users = [];

Future<void> getUsers() async {
final response = await http.get(Uri.parse('$baseUrl/users'));

if(response.statusCode == 200){
  final List<dynamic> data = json.decode(response.body);
  users = data.map((user)=>UserModel.fromJson(user)).toList();
}else{
  throw Exception('Failed to load users');
}
notifyListeners();
}

Future<void> addUser(UserModel user) async {
    // ignore: unused_local_variable
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
if(response.statusCode == 201){
  users.add(user);
}else{
  throw Exception('Failed to add user');
}
notifyListeners();
}
 
 Future<void> updateUser(UserModel user) async {
    // ignore: unused_local_variable
    final response = await http.put(
      Uri.parse('$baseUrl/users/{id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200){
    int index = users.indexWhere((u)=>u.id == user.id);
    if(index != -1){
    users[index] = user;
    }
    }else{
      throw Exception('Failed to update user');
    }
    notifyListeners();
  }

Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/{id}'));

    if (response.statusCode == 200) {
      users.removeWhere((user) => user.id == id);
    } else {
      throw Exception('Failed to delete user');
    }
    notifyListeners();
  }
}