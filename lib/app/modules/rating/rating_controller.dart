import 'package:get/get.dart';
import '../../data/models/comment.dart';
import '../../data/models/comments.dart';
import '../../data/models/student.dart';
import '../../data/models/students.dart';
import '../../data/services/sort_service.dart';

class RatingController extends GetxController {
  RatingController() {
    sortService = SortService(
      filterAll: filterByAll,
      filterDate: filterByDate,
      filterWeek: filterByWeek,
      filterMonth: filterByMonth,
    ).obs;
  }

  // data student
  Rx<Student> student = Student(name: "default").obs;

  dynamic id = Get.arguments;

  @override
  void onInit() {
    student.value = Students.findStudent(id);
    listComments.value = Comments.listCommentsFindById(id);
    super.onInit();
  }

  // comment
  RxList<Comment> listComments = <Comment>[].obs;
  // dropButton sort value
  Rx<SortService>? sortService;

  // fuction
  void backToPrevScreen() {
    Get.back();
  }

  void filterByAll() {
    // update list comment by date
    listComments.value = Comments.listCommentsFindById(id);
  }

  void filterByDate() {
    // update list comment by date
    listComments.value = Comments.listCommentsSortByDate(id);
  }

  void filterByWeek() {
    // update list comment by week
    listComments.value = Comments.listCommentsSortByWeek(id);
  }

  void filterByMonth() {
    // update list comment by month
    listComments.value = Comments.listCommentsSortByMonth(id);
  }
}
