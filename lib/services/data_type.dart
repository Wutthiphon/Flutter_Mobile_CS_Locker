import 'package:flutter/material.dart';

class AppMenuItem {
  final Icon icon;
  final String label;
  final Widget page;

  AppMenuItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}

// เก็บข้อมูล locker
class Locker{
  final int locker_id;
  final String locker_num;
  final int status;

  Locker({
    required this.locker_id,
    required this.locker_num,
    required this.status,
  });

  factory Locker.fromJson(Map<String, dynamic> json) => Locker(
        locker_id: json["locker_id"],
        locker_num: json["locker_num"],
        status: json["status"]
    );

    Map<String, dynamic> toJson() => {
        "locker_id":locker_id,
        "locker_num":locker_num,
        "status":status
    };
}


// เก็บข้อมูลตู้ที่จอง
class Rsv{
  final int rsv_id;
  final int user_id;
  final int locker_id;
  final String password;
  final DateTime date;
  final String locker_num;

  Rsv({
    required this.rsv_id,
    required this.locker_id,
    required this.user_id,
    required this.password,
    required this.date,
    required this.locker_num,
  });

  factory Rsv.fromJson(Map<String,dynamic>json) => Rsv(
    rsv_id: json["rsv_id"],
    locker_id: json["locker_id"],
    user_id: json["user_id"],
    password: json["password"],
    date:json["date"],
    locker_num:json["locker_num"],
  );

  Map<String, dynamic> toJson() => {
        "rsv_id":rsv_id,
        "locker_id":locker_id,
        "user_id":user_id,
        "password":password,
        "date":date,
        "locker_num":locker_num,
    };
}

// user information
class User{
  final int user_id;
  final String username;
  final String name;
  final String email;

  User({
    required this.user_id,
    required this.username,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String,dynamic>json) => User(
    user_id:json["user_id"],
    username:json["username"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
        "user_id":user_id,
        "username":username,
        "name":name,
        "email":email,
    };
}

