import 'package:egreenbin/app/data/models/student.dart';
import 'package:get/get.dart';

class StudentInfoController extends GetxController {
  StudentInfoController() {
    selectedMonth = monthItems[0].obs;
  }

  Student student = Student(
    id: "21522345",
    name: "Nguyễn Thành Trung",
    numOfCorrect: 92,
    numOfWrong: 1,
  );

  // dropdown month
  List<String> monthItems = <String>[
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
  ];

  RxString selectedMonth = ''.obs;

  void changeMonthItem(String newValue) {
    selectedMonth.value = newValue;
  }
}
