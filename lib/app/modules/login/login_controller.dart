import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/providers/Garbages.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  // text controllers
  final idController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    idController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void pushToHomeScreen() {
    Get.toNamed(AppRoutes.home);
  }

  Future signIn(BuildContext context) async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    // load list of garbages
    Garbages.gernerateGabages();

    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    pushToHomeScreen();
  }
}
