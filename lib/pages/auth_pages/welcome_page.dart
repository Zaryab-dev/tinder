import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/reusable_button.dart';
import '../../common/reusable_text.dart';
import '../../common/text_field.dart';
import '../../controllers/auth_controller.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/logo.png',height: size.height * 0.4,fit: BoxFit.cover,
              )),
              reusableText(text: 'Welcome',textColor: Colors.black,size: size.height * 0.024,),
              reusableText(text: 'Login now to find your best match',textColor: Colors.black,size: size.height * 0.02,),
              SizedBox(height: size.height * 0.03,),
              SizedBox(
                  width: size.width * 0.88,
                  child: CustomTextField(
                      controller: _emailController,
                      iconData: Icons.alternate_email, action: TextInputAction.next, type: TextInputType.emailAddress, size: size.height * 0.01, hintText: 'Email')),
              SizedBox(height: size.height * 0.03,),
              SizedBox(
                  width: size.width * 0.88,
                  child: CustomTextField(
                      controller: _passwordController,
                      iconData: Icons.lock_outline,
                      isObscure: true,
                      action: TextInputAction.done, type: TextInputType.visiblePassword, size: size.height * 0.01, hintText: 'Password')),
              SizedBox(height: size.height * 0.05,),
              SizedBox(
                  width: size.width * 0.88,
                  height: size.height * 0.065,
                  child: reusableButton(text: 'Login', onPress: () async{
                   await controller.loggedInUser(_emailController.text.trim(), _passwordController.text.trim(), context);
                    _emailController.clear();
                    _passwordController.clear();
                  })),
              SizedBox(height: size.height * 0.02,),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: RichText(text: const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Get one' ,style: TextStyle(color: Colors.black,fontFamily: 'Round',fontWeight: FontWeight.bold),
                    )
                  ]
                ),),
              ),
              SizedBox(height: size.height * 0.05,),
            ],
          ),
        ),
      ),
    );
  }
}
