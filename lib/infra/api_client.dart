import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:studio_andy_app/infra/network_client.dart';
import 'package:studio_andy_app/infra/api_request.dart';

enum HTTPMethod { GET, POST, DELETE, PUT }

class APIClient extends NetworkClient {
  static Future<dynamic> request(APIRequest request) async {
    final baseURL = request.baseURL ?? 'https://cdn.contentful.com';

    if (request.method == HTTPMethod.GET) {
      final transformParams = (Map<String, String> params) {
        if (params.isEmpty) return '';
        return '?' +
            params.keys
                .map((key) => key.toString() + '=' + params[key].toString())
                .join('&');
      };
      // TODO: Try and Catch
      var response = await http.get(
          Uri.encodeFull(
              baseURL + request.path + transformParams(request.params)),
          headers: {
            "Accept": "application/json",
          });

      return json.decode(utf8.decode(response.bodyBytes));
    }
  }
}
