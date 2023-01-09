import 'package:egreenbin/app/data/models/comments.dart';
import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/models/students.dart';
import 'package:get/get.dart';
import '../../data/models/comment.dart';

class StudentInfoController extends GetxController {
  StudentInfoController() {
    selectedMonth = monthItems[0].obs;
    selectedSort = sortItems[0].obs;
  }
  // data student
  Students listStudent = Students();
  Rx<Student> student = Student(name: "default").obs;

  dynamic id = Get.arguments;

  @override
  void onInit() {
    student.value = listStudent.findStudent(id);
    listComments = allcomments.listCommentsFindById(id);
    super.onInit();
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

  // comment
  Comments allcomments = Comments();
  List<Comment> listComments = [];
}
