import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/global_var.dart';
import 'package:tinder/common/reusable_button.dart';

import '../../controllers/home_controller.dart';

class UserSettings extends StatelessWidget {
  UserSettings({super.key});
  final homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: SizedBox(
                width: 300,
                child: reusableButton(text: 'LogOut', onPress: () async{
                 await firebaseAuth.signOut().then((value) {
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    homeController.changeIndex(0);
                  });
                }),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
