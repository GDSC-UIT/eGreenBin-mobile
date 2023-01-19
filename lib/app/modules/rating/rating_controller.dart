import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../data/models/comments.dart';
import '../../data/models/student.dart';
import '../../data/models/students.dart';
import '../../data/services/sort_service.dart';

class RatingController extends GetxController {
  RatingController() {
    sortService = SortService().obs;
  }

  // data student
  Students listStudent = Students();
  Rx<Student> student = Student(name: "default").obs;

  dynamic id = Get.arguments;

  @override
  void onInit() {
    student.value = listStudent.findStudent(id);
    listComments = Comments.listCommentsFindById(id);
    super.onInit();
  }

  @override
  void onReady() {
    listComments = Comments.listCommentsFindById(id);
    super.onReady();
  }

  // comment
  List<Comment> listComments = [];
  // dropButton sort value
  Rx<SortService>? sortService;

  // fuction
  void backToPrevScreen() {
    Get.back();
  }
}
