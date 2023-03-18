import 'package:egreenbin/app/data/models/comment.dart';
import 'package:egreenbin/app/data/providers/data_center.dart';
import '../../domain/repositories/comment_interface.dart';
import '../enums/sortType.dart';
import '../providers/apis/comment_api.dart';

class CommentRepository implements ICommentRepository {
  final commentApi = CommentAPI();

  @override
  Future<List<Comment>> fetchComments() async {
    DataCenter.instance.comments.value = await commentApi.fetchComments();
    return DataCenter.instance.comments;
  }

  /* @override
  Future<List<Comment>> getCommentsByIDStudent(String idStudent) async {
    return await commentApi.getCommentsByIDStudent(idStudent);
  } */

  @override
  Future<void> addComment(Comment comment) async {
    final newComment = await commentApi.addComment(comment);
    DataCenter.instance.comments.add(newComment);
  }

  @override
  Future<void> deleteComment(Comment comment) async {
    final delCommnet = await commentApi.deleteComment(comment);
    DataCenter.instance.comments.remove(delCommnet);
  }

  // local ==========================================================

  List<Comment> getListCommentsFindByIdStudentLocal(String id) {
    List<Comment> list = [];
    for (var com in DataCenter.instance.comments) {
      if (com.idStudent == id) list.add(com);
    }
    return list;
  }

  List<Comment> getListCommentsSortByDate(String id) {
    List<Comment> list = [];
    for (var com in DataCenter.instance.comments) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Date) {
        list.add(com);
      }
    }
    return list;
  }

  List<Comment> getListCommentsSortByYear(String id) {
    List<Comment> list = [];
    for (var com in DataCenter.instance.comments) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Year) {
        list.add(com);
      }
    }
    return list;
  }

  List<Comment> getListCommentsSortByMonth(String id) {
    List<Comment> list = [];
    for (var com in DataCenter.instance.comments) {
      if (com.idStudent == id && com.dateSort!.type == SortType.Month) {
        list.add(com);
      }
    }
    return list;
  }

  Future printListComment() async {
    for (Comment com in DataCenter.instance.comments) {
      print(com.toString());
    }
  }
}
