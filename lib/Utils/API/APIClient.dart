import 'package:get/get.dart';

class APIClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> mainHeaders;

  APIClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    mainHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
