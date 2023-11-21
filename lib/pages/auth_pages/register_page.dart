import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/reusable_button.dart';
import '../../common/reusable_text.dart';
import '../../common/text_field.dart';
import '../../controllers/auth_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Personal info
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _profileHeaderController = TextEditingController();
  final _lookingForInPartnerController = TextEditingController();

  // Appearance
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _bodyTypeController = TextEditingController();

  // Life Style

  final _drinkController = TextEditingController();
  final _smokeController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _professionController = TextEditingController();
  final _employmentStatusController = TextEditingController();
  final _livingSituationController = TextEditingController();
  final _willingToRelocateController = TextEditingController();
  final _relationYouAreLookingForController = TextEditingController();

  // Cultural Background

  final _nationalityController = TextEditingController();
  final _educationController = TextEditingController();
  final _languageSpokenController = TextEditingController();
  final _religionController = TextEditingController();
  final _ethnicityController = TextEditingController();

  // int currentIndex = 0;
  final PageController _pageController = PageController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (authController.index.value + 1) / 4,
                valueColor: const AlwaysStoppedAnimation<Color>(
                    CupertinoColors.systemPink),
              ),
              Container(
                  alignment: Alignment.center,
                  child: reusableText(
                      text: '${authController.index.value + 1} / 4',
                      textColor: CupertinoColors.link)),
              Expanded(child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  authController.changeIndex(index);
                },
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            reusableText(
                                text: 'Create an account \n    to get started',
                                size: size.height * 0.022,
                                textColor: Colors.black),
                            Container(
                              width: size.width * 0.06,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          height: size.height * 0.18,
                          width: size.height * 0.18,
                          child: Obx(() {
                            if (authController.selectedImage.value.path == '') {
                              return Container(
                                height: size.height * 0.18,
                                width: size.height * 0.18,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage(
                                        'assets/images/profile_avatar.jpg'))
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        authController.pickImage();
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 5, right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white, width: 2)
                                          ),
                                          child: const Icon(Icons.add,
                                            color: CupertinoColors.white,))),
                                ),
                              );
                            } else {
                              return CircleAvatar(
                                radius: 100,
                                backgroundImage: FileImage(authController.selectedImage.value),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        authController.pickImage();
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: 5, right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white, width: 2)
                                          ),
                                          child: const Icon(Icons.add,
                                            color: CupertinoColors.white,))),
                                ),
                              );
                            }
                          }),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        reusableText(text: 'Profile info ->',
                            textColor: Colors.black,
                            size: size.height * 0.025),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //name
                        CustomTextField(
                            iconData: Icons.person_outline,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Name',
                            controller: _nameController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //email
                        CustomTextField(
                            iconData: Icons.alternate_email,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Email',
                            controller: _emailController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //password
                        CustomTextField(
                            iconData: Icons.lock_outline,
                            action: TextInputAction.next,
                            type: TextInputType.visiblePassword,
                            hintText: 'Password',
                            controller: _passwordController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //age
                        CustomTextField(
                            iconData: Icons.numbers_sharp,
                            action: TextInputAction.next,
                            type: TextInputType.number,
                            hintText: 'Age',
                            controller: _ageController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //phone
                        CustomTextField(
                            iconData: Icons.phone,
                            action: TextInputAction.next,
                            type: TextInputType.number,
                            hintText: 'Phone',
                            controller: _phoneNumberController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //city
                        CustomTextField(
                            iconData: Icons.location_city_rounded,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'City',
                            controller: _cityController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //country
                        CustomTextField(
                            iconData: Icons.location_city,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Country',
                            controller: _countryController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //profileHeading
                        CustomTextField(
                            iconData: Icons.text_fields_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Profile heading',
                            controller: _profileHeaderController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //looking for relation
                        CustomTextField(
                            iconData: Icons.face,
                            action: TextInputAction.done,
                            type: TextInputType.text,
                            hintText: 'What you\'re looking for in a partner',
                            controller: _lookingForInPartnerController),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Container(
                          height: size.height * 0.065,
                          child: reusableButton(text: 'Next', onPress: () {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 1),
                                curve: Curves.ease);
                          }),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage(
                              'assets/images/profile_avatar.jpg'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        reusableText(text: 'Appearance 😍',
                            textColor: Colors.black,
                            size: size.height * 0.025),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        //name
                        CustomTextField(
                            iconData: Icons.height,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Height',
                            controller: _heightController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //email
                        CustomTextField(
                            iconData: Icons.monitor_weight_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Weight',
                            controller: _weightController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //password
                        CustomTextField(
                            iconData: Icons.filter_none,
                            action: TextInputAction.done,
                            type: TextInputType.text,
                            hintText: 'Body type',
                            controller: _bodyTypeController),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        //age
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.065,
                              width: size.width * 0.45,
                              child: reusableButton(
                                  text: 'Previous', onPress: () {
                                _pageController.previousPage(
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeInCubic);
                              }),
                            ),
                            SizedBox(
                              height: size.height * 0.065,
                              width: size.width * 0.45,
                              child: reusableButton(text: 'Next', onPress: () {
                                _pageController.nextPage(
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeInCubic);
                              },),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage(
                              'assets/images/profile_avatar.jpg'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        reusableText(text: 'Life Style 👽',
                            textColor: Colors.black,
                            size: size.height * 0.025),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //name
                        CustomTextField(
                            iconData: Icons.local_drink_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Drink',
                            controller: _drinkController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //email
                        CustomTextField(
                            iconData: Icons.smoke_free_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Smoke',
                            controller: _smokeController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //password
                        CustomTextField(
                            iconData: CupertinoIcons.person_2,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Marital status',
                            controller: _maritalStatusController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        // profession
                        CustomTextField(
                            iconData: Icons.business_center_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Profession',
                            controller: _professionController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //country
                        CustomTextField(
                            iconData: Icons.work,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Employee status',
                            controller: _employmentStatusController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //profileHeading
                        CustomTextField(
                            iconData: Icons.person_add_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Living situation',
                            controller: _livingSituationController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //looking for relation
                        CustomTextField(
                            iconData: Icons.workspaces_filled,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Do you want to relocate?',
                            controller: _willingToRelocateController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextField(
                            iconData: Icons.person_add_alt_rounded,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Which relation your\'re looking for?',
                            controller: _relationYouAreLookingForController),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.065,
                              width: size.width * 0.45,
                              child: reusableButton(
                                  text: 'Previous', onPress: () {
                                _pageController.previousPage(
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeInCirc);
                              }),
                            ),
                            SizedBox(
                              height: size.height * 0.065,
                              width: size.width * 0.45,
                              child: reusableButton(text: 'Next', onPress: () {
                                _pageController.nextPage(
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeInOutCubicEmphasized);
                              },),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage(
                              'assets/images/profile_avatar.jpg'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        reusableText(text: 'Cultural info 🕋',
                            textColor: Colors.black,
                            size: size.height * 0.025),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //name
                        CustomTextField(
                            iconData: CupertinoIcons.flag_circle_fill,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Nationality',
                            controller: _nationalityController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //email
                        CustomTextField(
                            iconData: Icons.history_edu_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Education',
                            controller: _educationController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //password
                        CustomTextField(
                            iconData: Icons.sign_language_outlined,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Language',
                            controller: _languageSpokenController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //age
                        CustomTextField(
                            iconData: Icons.check_box_outline_blank_sharp,
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            hintText: 'Religion',
                            controller: _religionController),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //phone
                        CustomTextField(
                            iconData: Icons.handshake_outlined,
                            action: TextInputAction.done,
                            type: TextInputType.text,
                            hintText: 'Ethnicity',
                            controller: _ethnicityController),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.065,
                              width: size.width * 0.45,
                              child: reusableButton(
                                  text: 'Previous', onPress: () {
                                _pageController.previousPage(
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeInCirc);
                              }),
                            ),
                            SizedBox(
                              height: size.height * 0.065,
                              width: size.width * 0.45,
                              child: reusableButton(text: 'Done', onPress: () {
                                authController.createUser(
                                    // _haveChildrenController.text.trim(),
                                    _willingToRelocateController.text.trim(),
                                    int.parse(_ageController.text.trim()),
                                    // int.parse(_noOfChildrenController.text.trim()),
                                    double.parse(_heightController.text.trim()),
                                    double.parse(_weightController.text.trim()),
                                    _passwordController.text.trim(),
                                    _emailController.text.trim(),
                                    _nameController.text.trim(),
                                    _phoneNumberController.text.trim(),
                                    _cityController.text.trim(),
                                    _countryController.text.trim(),
                                    _profileHeaderController.text.trim(),
                                    _lookingForInPartnerController.text.trim(),
                                    _bodyTypeController.text.trim(),
                                    _drinkController.text.trim(),
                                    _smokeController.text.trim(),
                                    _maritalStatusController.text.trim(),
                                    _professionController.text.trim(),
                                    _employmentStatusController.text.trim(),
                                    _livingSituationController.text.trim(),
                                    _relationYouAreLookingForController.text.trim(),
                                    _nationalityController.text.trim(),
                                    _educationController.text.trim(),
                                    _languageSpokenController.text.trim(),
                                    _religionController.text.trim(),
                                    _ethnicityController.text.trim(),
                                    authController.selectedImage.value,
                                    context,
                                );
                              },),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        );
      }
      ),
    );
  }
}

class CustomLinearProgressIndicator extends StatelessWidget {
  final int totalSegments;
  final int currentSegment;

  CustomLinearProgressIndicator({
    required this.totalSegments,
    required this.currentSegment,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> segments = List.generate(
      totalSegments,
          (index) =>
          Expanded(
            child: Container(
              height: 8.0,
              color: index < currentSegment
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.5),
            ),
          ),
    );

    return Container(
      child: Row(
        children: segments,
      ),
    );
  }
}
