import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Controller/SplashController.dart';
class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key, required this.title});
  final String title;

  @override
  State<SplashActivity> createState() => _SplashState();
}

class _SplashState extends State<SplashActivity> {
  SplashController controller=Get.put(SplashController());

 /* @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/getStartActivity');
      });
  }  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'App Logo',
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}