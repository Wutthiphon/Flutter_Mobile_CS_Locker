import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../http_service.dart';

final String apiURL = "${dotenv.env['API_URL']}/home";

class HttpGetAPIService {
  Future geHomePageImage() async {
    return APIService(
      url: "$apiURL/get-images",
      method: 'GET',
    ).fetch();
  }
}
