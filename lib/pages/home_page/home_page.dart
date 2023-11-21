import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/global_var.dart';
import 'package:tinder/controllers/home_controller.dart';
import 'package:tinder/pages/home_page/favorite_page.dart';
import 'package:tinder/pages/home_page/like_page.dart';
import 'package:tinder/pages/home_page/news_feed_page.dart';
import 'package:tinder/pages/home_page/profile_page.dart';
import 'package:tinder/pages/home_page/view_profile_page.dart';

import '../../common/reusable_text.dart';
import '../../controllers/notification_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

  final iconList = <IconData>[
    Icons.home_filled,
    CupertinoIcons.eye,
    CupertinoIcons.star,
    CupertinoIcons.heart,
    CupertinoIcons.person
  ];

  final List _bottomNav = [
    NewsFeedPage(),
    ViewProfilePage(),
    FavoritePage(),
    LikePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    NotificationController notificationController = NotificationController();
    notificationController.generateDeviceToken();
    notificationController.whenNotificationReceived(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _bottomNav[homeController.index.value]),
      bottomNavigationBar: Obx( () {
          return BottomNavigationBar(
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              homeController.changeIndex(index);
            },
            currentIndex: homeController.index.value,
            showSelectedLabels: false,

            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,),label: '',activeIcon: Icon(CupertinoIcons.home,size: 26,)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.eye),label: '',activeIcon: Icon(CupertinoIcons.eye_fill,size: 27,)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.star),label: '',activeIcon: Icon(CupertinoIcons.star_fill,size: 27,)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),label: '',activeIcon: Icon(CupertinoIcons.heart_fill,size: 27,)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: '',activeIcon: Icon(CupertinoIcons.person_fill,size: 27,)),
            ],
          );
        }
      ),
    );
  }
}
