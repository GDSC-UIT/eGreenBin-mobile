import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import '../models/garbage.dart';

class Garbages {
  static List<Garbage> listGarbage = [];

  Garbages() {
    gernerateGabages();
  }

  // generate gabages of all student
  static Future gernerateGabages() async {
    for (Student student in DataCenter.instance.students) {
      await gernerateGabagesOfEachStudent(student);
    }
  }

  // generate gabages of each student
  static Future gernerateGabagesOfEachStudent(Student student) async {
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
  static int getNumOfCorrect(String idStudent) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (gar.isRight) num++;
      }
    }
    return num;
  }

  static int getNumOfWrong(String idStudent) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (!gar.isRight) num++;
      }
    }
    return num;
  }

  // sort by month
  static int getNumOfCorrectByMonth(String idStudent, int month) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (gar.isRight && gar.dateCreate!.month == month) num++;
      }
    }
    return num;
  }

  static int getNumOfWrongByMonth(String idStudent, int month) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (!gar.isRight && gar.dateCreate!.month == month) num++;
      }
    }
    return num;
  }

  // sort by year
  static int getNumOfCorrectByYear(String idStudent, int year) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (gar.isRight && gar.dateCreate!.year == year) num++;
      }
    }
    return num;
  }

  static int getNumOfWrongByYear(String idStudent, int year) {
    int num = 0;
    for (Garbage gar in listGarbage) {
      if (gar.idStudent == idStudent) {
        if (!gar.isRight && gar.dateCreate!.year == year) num++;
      }
    }
    return num;
  }
}
