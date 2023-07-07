import 'package:egreenbin/app/modules/login/login_binding.dart';
import 'package:egreenbin/app/modules/login/screens/login_screen.dart';
import 'package:egreenbin/app/modules/mail/screens/mail_screen.dart';
import 'package:egreenbin/app/modules/notification/notification_binding.dart';
import 'package:egreenbin/app/modules/notification/screens/notification_screen.dart';
import 'package:egreenbin/app/modules/student_info/screens/student_info_screen.dart';
import 'package:egreenbin/app/modules/student_info/student_info_binding.dart';
import 'package:get/get.dart';
import '../modules/mail/mail_binding.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/screens/home_screen.dart';
import '/app/routes/app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.studentInfo,
      page: () => StudentInfoScreen(),
      binding: StudentInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.mail,
      page: () => const MailScreen(),
      binding: MailBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
  ];
}
