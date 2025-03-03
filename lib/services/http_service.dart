// Call CallAPI('url', 'METHOD)

import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  late final String url;
  late final String method;
  late final dynamic data;

  APIService({required this.url, required this.method, this.data});

  // IF Post Put Patch and have data to send
  Future<dynamic> fetch() async {
    http.Response response = http.Response('', 500);
    if (method == 'GET') {
      response = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
    } else if (method == 'POST') {
      response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
    } else if (method == 'PUT') {
      response = await http.put(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
    } else if (method == 'PATCH') {
      response = await http.patch(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
    } else if (method == 'DELETE') {
      response = await http.delete(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
