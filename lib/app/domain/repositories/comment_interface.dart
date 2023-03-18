import 'package:egreenbin/app/data/models/comment.dart';

abstract class ICommentRepository {
  Future<List<Comment>> fetchComments();
  Future<List<Comment>> getCommentsByIDStudent(String idStudent);
  Future<void> addComment(Comment comment);
  Future<void> deleteComment(Comment comment);
}
