import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response> postRequest({body, url}) async {
    return await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
  }

  static Future<http.Response> putRequest({body, url}) async {
    return await http.put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
  }

  static Future<http.Response> getRequest(url) async {
    return await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<http.Response> deleteRequest({url, id}) async {
    final uri = Uri.parse('$url/$id');
    return await http.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
