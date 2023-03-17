import 'package:egreenbin/app/data/models/comment.dart';
import 'package:egreenbin/app/data/models/student.dart';
import '../../domain/repositories/comment_interface.dart';
import '../providers/apis/comment_api.dart';

class CommentRepository implements ICommentRepository {
  final commentApi = CommentAPI();

  @override
  Future<List<Comment>> fetchComments() async {
    return await commentApi.fetchComments();
  }

  @override
  Future<List<Comment>> getCommentsByIDStudent(String idStudent) async {
    return await commentApi.getCommentsByIDStudent(idStudent);
  }

  @override
  Future<Comment> addComment(Comment comment, Student student) async {
    return await commentApi.addComment(comment, student);
  }

  @override
  Future<Comment> deleteComment(Comment comment) async {
    return await commentApi.deleteComment(comment);
  }
}
