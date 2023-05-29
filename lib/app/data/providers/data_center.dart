import 'package:egreenbin/app/data/models/result_cell.dart';
import 'package:get/get.dart';
import '../models/garbage.dart';
import '../models/teacher.dart';
import '../models/comment.dart';
import '../models/notification.dart' as noti;
import '../models/student.dart';

class DataCenter extends GetxController {
  static final DataCenter instance = DataCenter._internal();

  factory DataCenter() {
    return instance;
  }

  DataCenter._internal();

  RxList<Student> students = <Student>[].obs;

  RxList<Comment> comments = <Comment>[].obs;

  RxList<Teacher> teachers = <Teacher>[].obs;

  RxList<Garbage> garbages = <Garbage>[].obs;

  RxList<noti.Notification> notifications = <noti.Notification>[].obs;

  RxList<ResultCell> resultCells = <ResultCell>[].obs;

  Future<void> fetchAllDataFromApi() async {
    // get all data when begin app or refresh
  }
}
