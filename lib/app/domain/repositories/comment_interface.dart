import 'package:egreenbin/app/data/models/comment.dart';
import 'package:egreenbin/app/data/models/student.dart';

abstract class ICommentRepository {
  Future<List<Comment>> fetchComments();
  Future<List<Comment>> getCommentsByIDStudent(String idStudent);
  Future<Comment> addComment(Comment comment, Student student);
  Future<Comment> deleteComment(Comment comment);
}
