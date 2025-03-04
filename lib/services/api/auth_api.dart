import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../http_service.dart';
import '../data_type.dart';

final String? apiURL = dotenv.env['API_URL'];

class HttpAuthAPIService {
  Future login(LoginUserData loginUserData) async {
    String url = "$apiURL/auth/user-login";
    return APIService(
      url: url,
      method: 'POST',
      data: {
        "email": loginUserData.username,
        "password": loginUserData.password,
      },
    ).fetch();
  }

  // register(String username, String password, String name, String email) async {
  //   // debugPrint(dotenv.env['API_URL']);

  //   String url = "$host/register";
  //   // final response = await http.post(Uri.parse(url), headers: {
  //   //   "Accept": "application/json",
  //   //   "content-type": "application/json",
  //   // }, body: {
  //   //   "username": username,
  //   //   "password": password,
  //   //   "name": name,
  //   //   "email": email,
  //   // });

  //   // if (response.statusCode == 200) {
  //   // } else {
  //   //   debugPrint('failed register!');
  //   //   throw Exception('failed register!');
  //   // }
  //   dynamic input = {
  //     "username": username,
  //     "password": password,
  //     "name": name,
  //     "email": email,
  //   };
  //   dynamic res = APIService(url: url, method: 'POST', data: input);
  // }

  // Future<User> login(String username, String password) async {
  //   String url = "$host/login";
  //   final response = await http.post(Uri.parse(url), headers: {
  //     "Accept": "application/json",
  //     "content-type": "application/json",
  //   }, body: {
  //     "username": username,
  //     "password": password,
  //   });

  //   if (response.statusCode == 200) {
  //     return User.fromJson(json.decode(response.body));
  //   } else {
  //     debugPrint('failed login!');
  //     throw Exception('failed login!');
  //   }
  // }

  // logout() async {
  //   String url = "$host/logout";
  //   final response = await http.get(Uri.parse(url), headers: {
  //     "Accept": "application/json",
  //     "content-type": "application/json",
  //   });
  //   if (response.statusCode == 200) {
  //   } else {
  //     debugPrint('failed logout!');
  //     throw Exception('failed logout!');
  //   }
  // }
}
