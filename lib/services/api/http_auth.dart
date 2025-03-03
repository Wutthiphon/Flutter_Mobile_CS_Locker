import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data_type.dart';

String host = "http://localhost:3000/api/auths";

class HttpAuth {
  register(String username, String password, String name, String email) async {
    String url = "$host/register";
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    }, body: {
      "username": username,
      "password": password,
      "name": name,
      "email": email,
    });

    if (response.statusCode == 200) {
    } else {
      debugPrint('failed register!');
      throw Exception('failed register!');
    }
  }

  Future<User> login(String username, String password) async {
    String url = "$host/login";
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    }, body: {
      "username": username,
      "password": password,
    });

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      debugPrint('failed login!');
      throw Exception('failed login!');
    }
  }

  logout() async {
    String url = "$host/logout";
    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
    } else {
      debugPrint('failed logout!');
      throw Exception('failed logout!');
    }
  }
  
}
