import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/services/email_service.dart';

class Mail {
  // student: student dang co
  // message: noi dung thong bao
  String? id;
  Student student;
  String content;

  Mail({
    this.id,
    required this.student,
    required this.content,
  }) {
    id ??= DateTime.now().toString();
  }

  void sendEmail() {
    String message =
        "https://i.pinimg.com/564x/1d/29/ba/1d29ba4fd39075469c13feae243c906f.jpg";
    if (student.isNote!) message += "\n$content";

    EmailService.sendEmail(
      student: student,
      message: content,
    );
  }
}
