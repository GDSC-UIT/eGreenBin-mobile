import 'package:egreenbin/app/core/extensions/date_ex.dart';
import 'package:egreenbin/app/data/models/garbage.dart';
import 'package:egreenbin/app/domain/repositories/garbage_interface.dart';
import '../models/student.dart';
import '../providers/apis/garbage_api.dart';
import '../providers/data_center.dart';

class GarbageRepository implements IGarbageRepository {
  final garbageApi = GarbageAPI();

  @override
  Future<List<Garbage>> fetchGarbages() async {
    DataCenter.instance.garbages.value = await garbageApi.fetchGarbages();
    return [...DataCenter.instance.garbages];
  }

  @override
  Future<List<Garbage>> getGarbagesByIDStudent(String idStudent) async {
    return garbageApi.getGarbagesByIDStudent(idStudent);
  }

  // get list of gadbages of student
  List<Garbage> getGabagesOfStudentLocal(String idStudent) {
    List<Garbage> listGarbages = [];
    for (Garbage gar in DataCenter.instance.garbages) {
      if (gar.idStudent == idStudent) {
        listGarbages.add(gar);
      }
    }
    return listGarbages;
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
      DataCenter.instance.garbages.add(
        Garbage(
          idStudent: student.id!,
          isRight: true,
        ),
      );
    }
    // wrong
    for (int i = 0; i < student.numOfWrong!; i++) {
      DataCenter.instance.garbages.add(
        Garbage(
          idStudent: student.id!,
          isRight: false,
        ),
      );
    }
  }

  // get number of right and wrong of each student with sort
  // first, u need to call getGabagesOfStudentLocal to get list gabages of student, then to funtions under
  // sort by all
  int getNumOfCorrect(List<Garbage> gabages) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (gar.isRight) num++;
    }
    return num;
  }

  int getNumOfWrong(List<Garbage> gabages) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (!gar.isRight) num++;
    }
    return num;
  }

  // sort by month
  int getNumOfCorrectByMonth(List<Garbage> gabages, int month) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (gar.isRight && gar.dateCreate!.month == month) num++;
    }
    return num;
  }

  int getNumOfWrongByMonth(List<Garbage> gabages, int month) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (!gar.isRight && gar.dateCreate!.month == month) num++;
    }
    return num;
  }

  // sort by year
  int getNumOfCorrectByYear(List<Garbage> gabages, int year) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (gar.isRight && gar.dateCreate!.year == year) num++;
    }
    return num;
  }

  int getNumOfWrongByYear(List<Garbage> gabages, int year) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (!gar.isRight && gar.dateCreate!.year == year) num++;
    }
    return num;
  }

  // TO DO: write two function
  // 1: get list garbages of sudent of each month
  List<Garbage> getGabagesEachMonth(List<Garbage> gabages, int month) {
    List<Garbage> listGarbages = [];
    for (Garbage gar in gabages) {
      if (gar.dateCreate!.month == month) {
        listGarbages.add(gar);
      }
    }
    return listGarbages;
  }

  // 2: get num of correct and wrong of each week in a month
  int getNumOfCorrectByWeek(List<Garbage> gabages, int week) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (gar.isRight && gar.dateCreate!.getWeekOfDateInMonth == week) num++;
    }
    return num;
  }

  int getNumOfWrongByWeek(List<Garbage> gabages, int week) {
    int num = 0;
    for (Garbage gar in gabages) {
      if (!gar.isRight && gar.dateCreate!.getWeekOfDateInMonth == week) num++;
    }
    return num;
  }
}
