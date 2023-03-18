import 'package:egreenbin/app/data/models/garbage.dart';
import 'package:egreenbin/app/domain/repositories/garbage_interface.dart';
import '../models/student.dart';
import '../providers/apis/garbage_api.dart';
import '../providers/data_center.dart';

class GarbageRepository implements IGarbageRepository {
  final garbageApi = GarbageAPI();

  static get listGarbage => null;

  @override
  Future<List<Garbage>> fetchGarbages() async {
    return garbageApi.fetchGarbages();
  }

  @override
  Future<List<Garbage>> getGarbagesByIDStudent(String idStudent) async {
    return garbageApi.getGarbagesByIDStudent(idStudent);
  }

  // generate gabages of all student
  Future gernerateGabages() async {
    for (Student student in DataCenter.instance.students) {
      await gernerateGabagesOfEachStudent(student);
    }
  }

  // generate gabages of each student
  Future gernerateGabagesOfEachStudent(Student student) async {
    // correct
    for (int i = 0; i < student.numOfCorrect!; i++) {
      listGarbage.add(
        Garbage(
          idStudent: student.id!,
          isRight: true,
        ),
      );
    }
    // wrong
    for (int i = 0; i < student.numOfWrong!; i++) {
      listGarbage.add(
        Garbage(
          idStudent: student.id!,
          isRight: false,
        ),
      );
    }
  }

  // get number of right and wrong of each student
  // sort by all
  int getNumOfCorrect(String idStudent) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (gar.isRight) num++;
      }
    }
    return num;
  }

  int getNumOfWrong(String idStudent) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (!gar.isRight) num++;
      }
    }
    return num;
  }

  // sort by month
  int getNumOfCorrectByMonth(String idStudent, int month) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (gar.isRight && gar.dateCreate!.month == month) num++;
      }
    }
    return num;
  }

  int getNumOfWrongByMonth(String idStudent, int month) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (!gar.isRight && gar.dateCreate!.month == month) num++;
      }
    }
    return num;
  }

  // sort by year
  int getNumOfCorrectByYear(String idStudent, int year) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (gar.isRight && gar.dateCreate!.year == year) num++;
      }
    }
    return num;
  }

  int getNumOfWrongByYear(String idStudent, int year) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (!gar.isRight && gar.dateCreate!.year == year) num++;
      }
    }
    return num;
  }
}
