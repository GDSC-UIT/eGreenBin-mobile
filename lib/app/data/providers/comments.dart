import 'package:egreenbin/app/data/models/date_sort.dart';
import '../models/comment.dart';

class Comments {
  static List<Comment> listCommentsFindById(String id) {
    List<Comment> list = [];
    for (var com in listAllCommets) {
      if (com.idStudent == id) list.add(com);
    }
    return list;
  }

  static List<Comment> listCommentsSortByDate(String id) {
    List<Comment> list = [];
    for (var com in listAllCommets) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Date) {
        list.add(com);
      }
    }
    return list;
  }

  static List<Comment> listCommentsSortByWeek(String id) {
    List<Comment> list = [];
    for (var com in listAllCommets) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Week) {
        list.add(com);
      }
    }
    return list;
  }

  static List<Comment> listCommentsSortByMonth(String id) {
    List<Comment> list = [];
    for (var com in listAllCommets) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Month) {
        list.add(com);
      }
    }
    return list;
  }

  static void addComment(Comment comment) {
    listAllCommets.add(comment);
  }

  static void deleteComment(Comment comment) {
    listAllCommets.remove(comment);
  }

  static List<Comment> listAllCommets = [
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromMonth(month: "Tháng 3"),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromMonth(month: "Tháng 5"),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromWeek(week: "Tuần 3"),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromWeek(week: "Tuần 6"),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522321",
      content:
          "Bé Quynh đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromMonth(month: "Tháng 1"),
    ),
    Comment(
      idStudent: "21522321",
      content:
          "Bé Quynh vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522321",
      content:
          "Bé Quynh đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522343",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522000",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21525455",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522455",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21520345",
      content:
          "Bé Quynh đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21520345",
      content:
          "Bé Quynh vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
    ),
    Comment(
      idStudent: "21522343",
      content:
          "Bé Quynh đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
    ),
  ];
}
