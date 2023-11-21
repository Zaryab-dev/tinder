import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:get/get.dart';
import 'package:tinder/common/reusable_text.dart';
import 'package:tinder/controllers/profile_controller.dart';

import '../../common/global_var.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(

      body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.black54,
                  height: size.height * 0.35,
                  width: size.width,
                  child: Image.network(profileController.profilePic.value,fit: BoxFit.contain,),
                ),
              ],
            ),
            Positioned(
                top: size.height * 0.35,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  height: size.height * 0.57,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02,),
                        Row(
                          children: [
                            reusableText(text: profileController.username.value,size: size.height * 0.03),
                            SizedBox(width: size.width * 0.02,),
                            reusableText(text: '•',size: size.height * 0.02),
                            SizedBox(width: size.width * 0.02,),
                            reusableText(text: profileController.age.value.toString(),size: size.height * 0.02),
                          ],
                        ),
                        SizedBox(height: size.height * 0.015,),
                        Row(
                          children: [
                            Icon(CupertinoIcons.house,size: size.height * 0.03,),
                            const SizedBox(width: 7,),
                            reusableText(text: 'Live in ${profileController.country.value}',size: size.height * 0.02,fontWeight: FontWeight.w500),
                          ],
                        ),
                        SizedBox(height: size.height * 0.008,),
                        Row(
                          children: [
                            Icon(CupertinoIcons.location_solid,size: size.height * 0.03,),
                            const SizedBox(width: 7,),
                            reusableText(text: '39 kilometers away ',size: size.height * 0.02,fontWeight: FontWeight.w500),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02,),
                        Container(
                          height: size.height * 0.08,
                          width: size.width * 0.61,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: size.width * 0.01,),
                              const Icon(Icons.wine_bar,color: Colors.deepPurple,),
                              SizedBox(width: size.width * 0.008,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  reusableText(text: 'looking for:',fontWeight: FontWeight.w500,textColor: Colors.deepPurple),
                                  reusableText(text: profileController.relationYouAreLookingFor.value,textColor: Colors.deepPurple),
                                ],
                              ),
                            ],
                          ),

                        ),
                        SizedBox(height: size.height * 0.015,),
                        Container(
                          height: 2,
                          width: size.width * 0.93,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: size.height * 0.02,),
                        reusableText(text: 'About me'),
                        Container(
                          margin: const EdgeInsets.all(0),
                          width: size.width,
                          child: reusableText(text: 'Meet me in The Louvre, I\'ll teach you how'
                            'to perfect your smize. A low-key girl who enjoys a cosy evening in by the fire. Looking for someone to do late night gallery trips with and read together'
                            'in comfortable silence.',fontWeight: FontWeight.w500,),
                        ),
                        SizedBox(height: size.height * 0.015,),
                        Container(
                          height: 2,
                          width: size.width * 0.93,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: size.height * 0.015,),
                        reusableText(text: 'Interests'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.grey,),
                                    borderRadius: BorderRadius.circular(25),),
                                onPressed: () {}, child: const Text('Programming'),),
                            SizedBox(width: size.width * 0.018,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey,),
                                borderRadius: BorderRadius.circular(25),),
                              onPressed: () {}, child: const Text('Fashion'),),
                            SizedBox(width: size.width * 0.018,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey,),
                                borderRadius: BorderRadius.circular(25),),
                              onPressed: () {}, child: const Text('Reading'),),

                          ],
                        ),
                        SizedBox(height: size.height * 0.015,),
                        Container(
                          height: 2,
                          width: size.width * 0.93,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: size.height * 0.02,),
                        reusableText(text: 'More about me'),
                        SizedBox(height: size.height * 0.005,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.grey,),
                                    borderRadius: BorderRadius.circular(25),),
                                onPressed: () {}, child: const Text('At Uni'),),
                            SizedBox(width: size.width * 0.018,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey,),
                                borderRadius: BorderRadius.circular(25),),
                              onPressed: () {}, child: const Text('Work in Google'),),
                            SizedBox(width: size.width * 0.018,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey,),
                                borderRadius: BorderRadius.circular(25),),
                              onPressed: () {}, child: const Text('Developer'),),

                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: size.height * 0.325,
                right: 10,
                child: Container(
                  height: size.height * 0.05,
                  width: size.height * 0.05,
                  decoration: const BoxDecoration(
                      color: CupertinoColors.systemPink,
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.arrow_downward,color: Colors.white,),
                )),
            Positioned(
                top: size.height * 0.03,
                right: size.width * 0.02,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/setting');
                  },
                  child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(CupertinoIcons.settings_solid,size: 30,color: Colors.white,)),
                )),
          ],
        ),
    );
  }
}
