import 'package:egreenbin/app/data/models/garbage.dart';
import 'dart:convert';
import 'package:egreenbin/app/core/values/api_values.dart';
import 'package:egreenbin/app/data/services/http_service.dart';

class GarbageAPI {
  Future<List<Garbage>> fetchGarbages() async {
    var response = await HttpService.getRequest(GARBAGES_URL);
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      List<Garbage> listGarbages =
          parsed.map<Garbage>((json) => Garbage.fromJson(json)).toList();
      return listGarbages;
    } else {
      throw Exception(
          'Failed to load garbages: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<List<Garbage>> getGarbagesByIDStudent(String idStudent) async {
    var response = await HttpService.getRequestWithId(
      url: GARBAGES_URL,
      id: idStudent,
    );
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      List<Garbage> listGarbages =
          parsed.map<Garbage>((json) => Garbage.fromJson(json)).toList();
      return listGarbages;
    } else {
      throw Exception(
          'Failed to load garbages: ${jsonDecode(response.body)['error']}');
    }
  }
}
