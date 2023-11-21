import 'package:flutter/material.dart';
import 'package:tinder/common/global_var.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      firebaseAuth.currentUser?.uid == null
          ? Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false)
          : Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png'),),
    );
  }
}
