import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/reusable_text.dart';

class UserDetailPage extends StatelessWidget {
  var data;
  UserDetailPage({super.key, required this.data});

  void startChattingOnWhatsApp() async {
    var androidUrl = "whatsapp://send?phone=${data['phoneNumber']}&text=Hi ${data['username']}, I found your number on dating app.";
    var iOSUrl = "https://wa.me/${data['phoneNumber']}?text=${Uri.parse('Hi ${data['username']}, I found your number on dating app.')}";
    try {
      if(Platform.isIOS) {
        await launchUrl(Uri.parse(iOSUrl.toString()));
      }else{
        await launchUrl(Uri.parse(androidUrl.toString()));
      }
    }on Exception{
      Get.snackbar('Failed', 'WhatsApp is not found');
    }
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
                child: Image.network(data['profilePic'],fit: BoxFit.cover,),
              ),
            ],
          ),
          Positioned(
              top: size.height * 0.35,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                height: size.height * 0.65,
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
                          reusableText(text: data['username'],size: size.height * 0.03),
                          SizedBox(width: size.width * 0.02,),
                          reusableText(text: '•',size: size.height * 0.02),
                          SizedBox(width: size.width * 0.02,),
                          reusableText(text: data['age'],size: size.height * 0.02),
                        ],
                      ),
                      SizedBox(height: size.height * 0.015,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.house,size: size.height * 0.03,),
                          const SizedBox(width: 7,),
                          reusableText(text: 'Live in ${data['country']}',size: size.height * 0.02,fontWeight: FontWeight.w500),
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
                        height: size.height * 0.07,
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
                                reusableText(text: data['relationYouAreLookingFor'],textColor: Colors.deepPurple),
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
                        child: reusableText(text: 'Meet me in The Louvre, I\'ll teach you how '
                            'to perfect your smize.',fontWeight: FontWeight.w500,),
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
              left: size.width * 0.02,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.height * 0.05,
                padding: EdgeInsets.only(left: size.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,))),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: CupertinoColors.activeGreen.darkColor,
        tooltip: 'Chat',
        onPressed: () {
          startChattingOnWhatsApp();
        },
        child: const Icon(CupertinoIcons.chat_bubble_fill,color: CupertinoColors.systemPink,),
      ),
    );
  }
}
