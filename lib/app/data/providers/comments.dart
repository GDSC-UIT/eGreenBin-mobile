import 'dart:convert';
import 'package:egreenbin/app/core/extensions/date_ex.dart';
import 'package:egreenbin/app/data/models/date_sort.dart';
import 'package:egreenbin/app/data/models/student.dart';
import '../../core/values/api_values.dart';
import '../enums/sortType.dart';
import '../models/comment.dart';
import '../services/http_service.dart';

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

  static List<Comment> listCommentsSortByYear(String id) {
    List<Comment> list = [];
    for (var com in listAllCommets) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Year) {
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

  static void deleteComment(Comment comment) {
    listAllCommets.remove(comment);
  }

  static Future printListComment() async {
    for (Comment com in listAllCommets) {
      print(com.toString());
    }
  }

  // http fetch comment from api
  static Future<void> fetchComments() async {
    var response = await HttpService.getRequest(COMMENTS_URL);
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      print(response.body);
      List<Comment> listGetComments =
          parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
      listAllCommets = listGetComments;
      await printListComment();
    } else {
      throw Exception(
          'Failed to load student: ${jsonDecode(response.body)['error']}');
    }
  }

  ///In this example, we first parse the input date string into a DateTime object using its current format. Then we format the DateTime object into the desired output format, which includes the missing "T" separator and the timezone offset. Finally, we print out the resulting formatted date string.

  static Future<void> addComment(Comment comment, Student student) async {
    // get sort type
    final String type = comment.dateSort!.valueSort;
    print(type);
    // get string date sort
    final String dateUpdated = comment.dateSort!.toJsonString();
    print(dateUpdated);
    print("idstudent: ${student.id}");
    // post new comment
    final response = await HttpService.postRequest(
      url: COMMENTS_URL,
      body: jsonEncode({
        'Student': {
          'id': student.id,
          'code': student.code,
          'name': student.name,
          'numOfCorrect': student.numOfCorrect,
          'numOfWrong': student.numOfWrong,
          'imageAvatarUrl': student.imageAvatarUrl,
          'parentEmail': student.parentEmail,
          'note': student.note,
        },
        'Content': comment.content,
        'type': type,
        'DateCreated': comment.dateCreate!.fommatDateTZ,
        'DateUpdated': dateUpdated,
      }),
    );
    print("Done");
    // check status
    if (response.statusCode == 201) {
      // create new student
      print(response.body);
      final newComment = Comment(
        id: json.decode(response.body)['data']['id'],
        idStudent: comment.idStudent,
        content: comment.content,
        dateCreate: comment.dateCreate,
        dateSort: comment.dateSort,
      );
      // add to list
      listAllCommets.add(newComment);
    } else {
      throw Exception(
          'Failed to add comment: ${jsonDecode(response.body)['error']}');
    }
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
      dateSort: DateSort.fromMonth(month: "March"),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung đã dần hình thành được thói quen phân loại rác. Đáng được tuyên dương và nhận phiếu bé ngoan!",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromMonth(month: "September"),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromYear(year: 2021),
    ),
    Comment(
      idStudent: "21522345",
      content:
          "Bé Trung vẫn còn nhầm lẫn khá nhiều giữa 2 loại rác nhưng nhìn chung đã có tiến bộ hơn.",
      dateCreate: DateTime(2022, 11, 12),
      dateSort: DateSort.fromYear(year: 2023),
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
      dateSort: DateSort.fromMonth(month: "January"),
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
