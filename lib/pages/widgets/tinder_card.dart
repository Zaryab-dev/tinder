import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/common/reusable_text.dart';

class TinderCard extends StatelessWidget {
  final String name, city, profilePic, profession,lookingFor;
  final int age;
  const TinderCard({super.key, required this.city, required this.name,
    required this.profilePic, required this.age, required this.profession, required this.lookingFor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(profilePic.toString()))),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.65, 1]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Row(
                children: [
                  reusableText(text: name,textColor: Colors.white,size: size.height * 0.03),
                  SizedBox(width: size.width * 0.02,),
                  reusableText(text: '•',textColor: Colors.white,size: size.height * 0.02),
                  SizedBox(width: size.width * 0.02,),
                  reusableText(text: age.toString(),textColor: Colors.white,size: size.height * 0.02),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.business_center_outlined, color: Colors.white,size: size.height * 0.03,),
                  const SizedBox(width: 7,),
                  reusableText(text: profession,textColor: Colors.white,size: size.height * 0.02),
                ],
              ),
              SizedBox(height: size.height * 0.005,),
              Row(
                children: [
                  Icon(Icons.person_add_alt, color: Colors.white,size: size.height * 0.03,),
                  const SizedBox(width: 7,),
                  reusableText(text: 'looking for $lookingFor',textColor: Colors.white,size: size.height * 0.02),
                ],
              ),
              SizedBox(height: size.height * 0.005,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 11,
                    width: 11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.activeGreen,
                    ),
                  ),
                  SizedBox(width: size.width * 0.03,),
                  reusableText(text: 'Live from $city',textColor: Colors.white,fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
