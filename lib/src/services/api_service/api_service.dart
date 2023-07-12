import 'package:enhanced_http/enhanced_http.dart';
import 'package:enhanced_http/interceptor.dart';
import 'package:hydrosense_mobile_app/src/constants/api_constants.dart';

const String base_url = ApiConstants.BASE_URL;

class ApiService {
  static EnhancedHttp http = EnhancedHttp(
      baseURL: base_url,
      headers: {
        'Content-Type': 'application/json',
        'SecretToken': 'Bearer ' + '',
        'AccessToken': 'access token',
      },
      interceptors: InterceptorOptions(response: (dynamic res) {
        print("Status ${res["status"]}");
        print("Headers ${res["headers"]}");
        print("Data ${res["data"]}");
        return res["data"];
      }, error: (dynamic e) {
        print(e);
        return "An error has occurred please try again later";
      }));
}
