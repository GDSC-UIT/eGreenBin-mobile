import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../data/models/comments.dart';
import '../../data/models/student.dart';
import '../../data/models/students.dart';

class RatingController extends GetxController {
  RatingController() {
    SelectedSortComment = sortCommentItems[0].obs;
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

  // comment
  Comments allcomments = Comments();
  List<Comment> listComments = [];
  // dropButton sort value
  List<String> sortCommentItems = <String>["Mới nhất", "Cũ nhất"];
  RxString SelectedSortComment = ''.obs;

  void changeSortCommentItem(String newValue) {
    SelectedSortComment.value = newValue;
  }
}
