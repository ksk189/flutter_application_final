import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_final/mainpages/mainpage.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({Key? key}) : super(key: key);

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/sas11.jpeg',
                width: 380,
              ),
              const Spacer(),
              Text(
                "\n\n\n\n\nWelcome to Ekisaan store 😊\n          🙏🏻 jai Kisaan 🙏🏻",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('designed & maintained by sasi')
            ],
          ),
        ),
      ),
    );
  }
}
