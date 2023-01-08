import 'package:egreenbin/app/core/values/assets_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Image.asset(Assets.chat)),
      ),
    );
  }
}
