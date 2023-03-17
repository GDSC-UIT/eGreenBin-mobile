import 'package:egreenbin/app/data/models/garbage.dart';
import 'package:egreenbin/app/domain/repositories/garbage_interface.dart';
import '../providers/apis/garbage_api.dart';

class GarbageRepository implements IGarbageRepository {
  final garbageApi = GarbageAPI();

  @override
  Future<List<Garbage>> fetchGarbages() async {
    return garbageApi.fetchGarbages();
  }

  @override
  Future<List<Garbage>> getGarbagesByIDStudent(String idStudent) async {
    return garbageApi.getGarbagesByIDStudent(idStudent);
  }
}
