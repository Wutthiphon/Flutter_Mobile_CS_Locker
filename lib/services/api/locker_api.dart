import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../http_service.dart';
import '../data_type.dart';

final String apiURL = "${dotenv.env['API_URL']}/locker";

class HttpLockerAPIService {
  Future getLockersNotInUsed() async {
    return APIService(
      url: "$apiURL/get-locker",
      method: 'GET',
    ).fetch();
  }

  Future getMyLockerInUsed() async {
    return APIService(
      url: "$apiURL/get-reservelocker",
      method: 'GET',
    ).fetch();
  }

  Future getMyLockerExpired() async {
    return APIService(
      url: "$apiURL/record-get",
      method: 'GET',
    ).fetch();
  }
}
