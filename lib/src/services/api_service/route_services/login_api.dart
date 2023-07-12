
import 'package:hydrosense_mobile_app/src/services/api_service/api_service.dart';

class LoginApi {
  static loginApi(dynamic body) async {
    final response = await ApiService.http.post("/login", payload: body);
    return response;
  }
}
