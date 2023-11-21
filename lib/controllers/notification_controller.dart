

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/global_var.dart';

import '../common/reusable_text.dart';

class NotificationController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // when notification received
  whenNotificationReceived(BuildContext context) {
    //1. Terminated
    // Future<void> _backgroundHandler(RemoteMessage? remoteMessage) async {
    //   // Extract data from the notification message
    //   if (remoteMessage != null) {
    //     openAppAndShowNotification(
    //       remoteMessage.data['userID'],
    //       remoteMessage.data['senderID'],
    //       context,
    //     );
    //   }
    //
    //   // Build and display the notification
    // }
    // FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        openAppAndShowNotification(
          remoteMessage.data['userID'],
          remoteMessage.data['senderID'],
          context,
        );
      }
    });

    //2. Foreground

    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        openAppAndShowNotification(
          remoteMessage.data['userID'],
          remoteMessage.data['senderID'],
          context,
        );
      }
    });

    //3. Background

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        openAppAndShowNotification(
          remoteMessage.data['userID'],
          remoteMessage.data['senderID'],
          context,
        );
      }
    });
  }

  openAppAndShowNotification(receiverID, senderID, context,) async {
    await firebaseFirestore
        .collection('users')
        .doc(senderID)
        .get()
        .then((snapshot) {
      String profilePic = snapshot.data()!['profilePic'].toString();
      String name = snapshot.data()!['name'].toString();
      String city = snapshot.data()!['city'].toString();
      String country = snapshot.data()!['country'].toString();
      String profession = snapshot.data()!['profession'].toString();
      String age = snapshot.data()!['age'].toString();
      String relationYouAreLookingFor = snapshot.data()!['relationYouAreLookingFor'].toString();
      Get.snackbar('$name ', 'message',
          barBlur: 2,
          backgroundColor: CupertinoColors.activeGreen,
          padding: const EdgeInsets.all(10),
          onTap: (value) {
            Navigator.of(context).pushNamed('/details',arguments: {
              'profilePic' : profilePic,
              'username' : name,
              'age' : age.toString(),
              'country' : country,
              'relationYouAreLookingFor' : relationYouAreLookingFor,
            });
      }, icon: CircleAvatar(backgroundImage: NetworkImage(profilePic.toString()),));
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return NotificationBox(
      //         senderID,
      //         profilePic,
      //         name,
      //         city,
      //         country,
      //         profession,
      //         age,
      //         context,
      //       );
      //     });
    });
  }

  // NotificationBox(senderID, profilePic, name, city, country, profession, age, context) {
  //     final size = MediaQuery.sizeOf(context);
  //   return Dialog(
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5),
  //         image: DecorationImage(
  //           image: NetworkImage(profilePic),
  //           fit: BoxFit.cover
  //         ),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Center(
  //             child: Row(
  //               children: [
  //                 reusableText(text: name,textColor: Colors.white,size: size.height * 0.03),
  //                 SizedBox(width: size.width * 0.02,),
  //                 reusableText(text: '•',textColor: Colors.white,size: size.height * 0.02),
  //                 SizedBox(width: size.width * 0.02,),
  //                 reusableText(text: age.toString(),textColor: Colors.white,size: size.height * 0.02),
  //               ],
  //             ),
  //           ),
  //           Center(
  //             child: Row(
  //               children: [
  //                 reusableText(text: city,textColor: Colors.white,size: size.height * 0.03),
  //                 SizedBox(width: size.width * 0.02,),
  //                 reusableText(text: '•',textColor: Colors.white,size: size.height * 0.02),
  //                 SizedBox(width: size.width * 0.02,),
  //                 reusableText(text: country.toString(),textColor: Colors.white,size: size.height * 0.02),
  //               ],
  //             ),
  //           ),
  //           _buildButtons(context),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future generateDeviceToken() async {
    String? deviceToken = await messaging.getToken();

    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      'userDeviceToken': deviceToken,
    });
  }
  _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Icon(CupertinoIcons.star_fill,color: CupertinoColors.link,size: 28,)),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Icon(CupertinoIcons.heart_fill,color: CupertinoColors.activeGreen,size: 28,)),
        ],
      ),
    );
  }

}
