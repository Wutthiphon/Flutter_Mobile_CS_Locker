import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data_type.dart';

String host = 'http://localhost:3000/api/lockers';

class HttpLocker {
  Future<List<Locker>> getAllLocker() async {
    String url = "$host/getAllLocker";
    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Locker.fromJson(e)).toList();
    } else {
      debugPrint('failed loading data!');
      throw Exception('Failed to load data!');
    }
  }

  //get all non rsv locker

  //get all rsv locker by user_id
  Future<List<Rsv>> getAllRsvLocker() async {
    String url = "$host/getAllRsvLocker";
    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Rsv.fromJson(e)).toList();
    } else {
      debugPrint('failed loading data!');
      throw Exception('Failed to load data!');
    }
  }

  // จอง
  reservation(int locker_id,int user_id) async {
    String url = "$host/reservationLocker";
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    }, body: {
      "locker_id":locker_id,
      "user_id":user_id,
    });

    if(response.statusCode == 200){

    }else{
      debugPrint('failed to reservation locker!');
      throw Exception('Failed to reservation locker');
    }
  }
  // ยกเลิกจอง
  cancelreservation(int locker_id,int user_id) async{
    String url = "$host/cancelreservationLocker";
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    }, body: {
      "locker_id":locker_id,
      "user_id":user_id,
    });
    if(response.statusCode == 200){

    }else{
      debugPrint('failed to cancelreservation locker!');
      throw Exception('Failed to cancelreservation locker');
    }
  }

  
}
