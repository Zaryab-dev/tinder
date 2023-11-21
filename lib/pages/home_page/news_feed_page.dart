import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/global_var.dart';
import 'package:tinder/common/reusable_button.dart';
import 'package:tinder/common/reusable_text.dart';
import 'package:tinder/controllers/favorite_controller.dart';
import 'package:tinder/controllers/home_controller.dart';
import 'package:tinder/controllers/like_controller.dart';
import 'package:tinder/controllers/profile_controller.dart';
import 'package:tinder/controllers/view_profile_controller.dart';
import 'package:tinder/pages/widgets/filters.dart';
import 'package:tinder/pages/widgets/tinder_card.dart';

class NewsFeedPage extends StatefulWidget {

  const NewsFeedPage({super.key,});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final homeController = Get.put(HomeController());

  final favController = Get.put(FavoriteController());

  final likeController = Get.put(LikeController());

  final viewController = Get.put(ViewProfileController());
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    homeController.getData();
    profileController.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Obx(
          () {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  CupertinoColors.systemPink,
                  Colors.black54,
                ],begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
              ),
              child: PageView.builder(
                controller: PageController(initialPage: 0, viewportFraction: 1),
                itemCount: homeController.userData.length,
                itemBuilder: (context, index) {
                  final eachProfileInfo = homeController.userData[index];
                  return Column(
                    children: [
                      _buildLogo(),
                      Expanded(child: InkWell(
                        onTap: () {
                          viewController.sendAndReceiveFavorite(eachProfileInfo.uid.toString(),profileController.username.value);
                          Navigator.of(context).pushNamed('/details',arguments: {
                            'profilePic' : eachProfileInfo.profilePic,
                            'username' : eachProfileInfo.name,
                            'age' : eachProfileInfo.age.toString(),
                            'country' : eachProfileInfo.country,
                            'phoneNumber' : eachProfileInfo.phoneNumber,
                            'relationYouAreLookingFor' : eachProfileInfo.relationYouAreLookingFor,
                          });
                        },
                        child: TinderCard(
                          profilePic: eachProfileInfo.profilePic,
                          name: eachProfileInfo.name,
                          city: eachProfileInfo.city,
                          age: eachProfileInfo.age,
                          profession: eachProfileInfo.profession,
                          lookingFor: eachProfileInfo.relationYouAreLookingFor,
                        ),
                      )),
                      _buildButtons(eachProfileInfo.uid.toString(),profileController.username.value),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  _buildLogo() {
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 5),
     child: Row(
        children: [
          const Icon(Icons.local_fire_department_rounded,size: 36,color: Colors.white,),
          const SizedBox(width: 4,),
          reusableText(text: 'Tinder',textColor: Colors.white,size: 25)
        ],
      ),
   );
  }

  _buildButtons(String toUserId, senderName) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {
            showDialog(context: context, builder: (context) => AlertDialog(
              content: ApplyFilters(),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        height: size.height * 0.06,
                        width: size.width/5,
                        child: reusableButton(text: 'Clear', onPress: () {
                          age = null;
                          chooseGenders = null;
                          chooseCountries = null;
                          Navigator.pop(context);
                        })),
                    SizedBox(width: size.width * 0.03,),
                    SizedBox(
                      height: size.height * 0.06,
                        width: size.width/3,
                        child: reusableButton(text: 'Apply filter', onPress: () {
                          homeController.getData();
                          Navigator.pop(context);
                        })),
                  ],
                )
              ],
              backgroundColor: CupertinoColors.systemGrey6,
              icon: const Icon(Icons.filter_list),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ));
          }, child: const Icon(CupertinoIcons.clear,color: CupertinoColors.systemPink,)),
          ElevatedButton(onPressed: () {
            favController.sendAndReceiveFavorite(toUserId, senderName);
          }, child: const Icon(CupertinoIcons.star_fill,color: CupertinoColors.link,size: 28,)),
          ElevatedButton(onPressed: () {
            likeController.sendAndReceiveLike(toUserId, senderName);
          }, child: const Icon(CupertinoIcons.heart_fill,color: CupertinoColors.activeGreen,size: 28,)),
        ],
      ),
    );
  }
}
