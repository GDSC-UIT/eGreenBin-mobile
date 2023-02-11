import 'package:egreenbin/app/data/models/student.dart';
import 'package:egreenbin/app/data/services/email_service.dart';

class Mail {
  // student: student dang co
  // message: noi dung thong bao
  String? id;
  Student student;
  String? imageUrl;

  Mail({
    this.id,
    required this.student,
    this.imageUrl,
  }) {
    id ??= DateTime.now().toString();
    imageUrl ??=
        "https://i.pinimg.com/564x/1d/29/ba/1d29ba4fd39075469c13feae243c906f.jpg";
  }

  Future sendEmail() async {
    String message = imageUrl!;
    if (student.isNote) message += "\n${student.note}";

    await EmailService.sendEmail(
      student: student,
      message: message,
    );
  }

  void setImageUrl(String url) {
    imageUrl = url;
  }

  void printEmail() {
    String message = imageUrl!;
    if (student.isNote) message += "\n${student.note}";
    // ignore: avoid_print
    print(message);
  }
}
