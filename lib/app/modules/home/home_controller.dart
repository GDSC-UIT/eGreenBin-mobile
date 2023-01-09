import 'package:egreenbin/app/data/models/students.dart';
import 'package:egreenbin/app/data/models/teacher.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController() {
    selectedClass = classItems[0].obs;
    selectedSort = sortItems[0].obs;
    numberOfStudent = listStudent.value.listStudents.length.obs;
  }
  // data
  Rx<Students> listStudent = Students().obs;

  Rx<Teacher> teacher = Teacher(
    name: "Hoàng Thì Linh",
    mgv: '20521000',
  ).obs;

  // class value
  RxInt numberOfStudent = 32.obs;
  // dropdown class
  List<String> classItems = <String>['Mầm C1', 'Mầm C2', 'Mầm C3'];
  RxString selectedClass = ''.obs;

  void changeClassItem(String newValue) {
    selectedClass.value = newValue;
  }

  // dropdown sort
  List<String> sortItems = <String>['Ngày', 'Tháng', 'Năm'];
  RxString selectedSort = ''.obs;

  void changeSortItem(String newValue) {
    selectedSort.value = newValue;
  }

  // datepicker
  Rx<DateTime?> selectDate = DateTime.now().obs;

  void changeDate(DateTime newDate) {
    selectDate.value = newDate;
  }
}
