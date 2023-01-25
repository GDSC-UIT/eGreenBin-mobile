import 'package:egreenbin/app/core/values/app_colors.dart';
import 'package:egreenbin/app/core/values/app_strings.dart';
import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:egreenbin/app/core/values/text_styles.dart';
import 'package:egreenbin/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.find<LoginController>();
  bool _showText = true;

  void showPassword() {
    setState(() {
      _showText = !_showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// Image logo and app name
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 300,
                    child: Image.asset(Assets.logo),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Center(
                      child: Text(
                        AppStrings.appName,
                        style: CustomTextStyle.logo(AppColors.normal),
                      ),
                    ),
                  )
                ],
              ),
// Sign in text
              const SizedBox(height: 5),
              Text(
                "Sign in",
                style: CustomTextStyle.h1(AppColors.primary1),
              ),
              const SizedBox(height: 20),
// mgv textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: TextFormField(
                      controller: _controller.idController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Mã giáo viên",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
// password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: TextFormField(
                      controller: _controller.passwordController,
                      obscureText: _showText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Mật khẩu",
                        suffixIcon: _showText
                            ? IconButton(
                                onPressed: showPassword,
                                icon: const Icon(Icons.remove_red_eye_outlined))
                            : IconButton(
                                onPressed: showPassword,
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.normal,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
// quen mat khau
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Quên mật khẩu?",
                        style: CustomTextStyle.b1(AppColors.normal),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
// sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () => _controller.signIn(context),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.normal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Đăng nhập",
                        style: CustomTextStyle.b9(AppColors.surface),
                      ),
                    ),
                  ),
                ),
              ),
// not a menber ? register now
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Chưa có tài khoản?",
                    style: CustomTextStyle.b1(AppColors.primary1),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Đăng ký ngay",
                      style: CustomTextStyle.b1(AppColors.normal),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
