// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player_online/view/screen_Home_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigation();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset("assets/loading.json"),
          ),
        ),
      ),
    );
  }
}

navigation() async {
  await Future.delayed(const Duration(seconds: 3));
  Get.off(() =>  const ScreenHome());
}
