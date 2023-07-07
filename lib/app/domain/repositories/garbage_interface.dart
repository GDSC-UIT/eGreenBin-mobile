import 'package:egreenbin/app/data/models/garbage.dart';

abstract class IGarbageRepository {
  Future<List<Garbage>> fetchGarbages();
  Future<List<Garbage>> getGarbagesByIDStudent(String idStudent);
}
