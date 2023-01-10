import 'package:egreenbin/app/modules/chat/chat_binding.dart';
import 'package:egreenbin/app/modules/chat/screens/chat_screen.dart';
import 'package:egreenbin/app/modules/login/login_binding.dart';
import 'package:egreenbin/app/modules/login/screens/login_screen.dart';
import 'package:egreenbin/app/modules/rating/rating_binding.dart';
import 'package:egreenbin/app/modules/rating/screens/rating_screen.dart';
import 'package:egreenbin/app/modules/student_info/screens/student_info_screen.dart';
import 'package:egreenbin/app/modules/student_info/student_info_binding.dart';
import 'package:get/get.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/screens/home_screen.dart';
import '/app/routes/app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.studentInfo,
      page: () => StudentInfoScreen(),
      binding: StudentInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.rating,
      page: () => RatingScreen(),
      binding: RatingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}
