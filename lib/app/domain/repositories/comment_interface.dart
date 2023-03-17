import 'package:egreenbin/app/data/models/comment.dart';
import 'package:egreenbin/app/data/models/student.dart';

abstract class ICommentRepository {
  Future<List<Comment>> fetchComments();
  Future<List<Comment>> getCommentsByIDStudent(String idStudent);
  Future<void> addComment(Comment comment, Student student);
  Future<void> deleteComment(Comment comment);
}
