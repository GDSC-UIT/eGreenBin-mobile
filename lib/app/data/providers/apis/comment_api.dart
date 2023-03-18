import 'dart:convert';
import '../../../core/values/api_values.dart';
import '../../models/comment.dart';
import '../../services/http_service.dart';

class CommentAPI {
  // http fetch comment from api
  Future<List<Comment>> fetchComments() async {
    var response = await HttpService.getRequest(COMMENTS_URL);
    List<Comment> listGetComments = [];
    if (response.statusCode == 200) {
      final parsed = ((json.decode(response.body)['data'] ?? []) as List)
          .cast<Map<String, dynamic>>();
      listGetComments =
          parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
      return listGetComments;
    } else {
      throw Exception(
          'Failed to load comments: ${jsonDecode(response.body)['error']}');
    }
  }

  // http get comment by idstudent from api
  /* Future<List<Comment>> getCommentsByIDStudent(String idStudent) async {
    var response = await HttpService.getRequestWithId(
      url: COMMENTS_URL,
      id: idStudent,
    );
    if (response.statusCode == 200) {
      final parsed = (json.decode(response.body)['data'] as List)
          .cast<Map<String, dynamic>>();
      List<Comment> listGetComments =
          parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
      return listGetComments;
    } else {
      throw Exception(
          'Failed to load comments: ${jsonDecode(response.body)['error']}');
    }
  } */

  ///In this example, we first parse the input date string into a DateTime object using its current format. Then we format the DateTime object into the desired output format, which includes the missing "T" separator and the timezone offset. Finally, we print out the resulting formatted date string.
  Future<Comment> addComment(Comment comment) async {
    // post new comment
    final response = await HttpService.postRequest(
      url: COMMENTS_URL,
      body: jsonEncode(comment.toJson()),
    );
    // check status
    if (response.statusCode == 201) {
      // create new student
      comment.setID = json.decode(response.body)['data']['id'];
      // add to list
      return comment;
    } else {
      throw Exception(
          'Failed to add comment: ${jsonDecode(response.body)['error']}');
    }
  }

  Future<Comment> deleteComment(Comment comment) async {
    // delete a comment by id
    var response = await HttpService.deleteRequest(
      url: COMMENTS_URL,
      id: comment.id,
    );
    // check status
    if (response.statusCode == 204) {
      //listAllCommets.remove(comment);
      return comment;
    } else {
      throw Exception(
          'Failed to delete student: ${jsonDecode(response.body)['error']}');
    }
  }
}
