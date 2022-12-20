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
  ];
}
