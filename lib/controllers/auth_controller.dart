import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../common/global_var.dart';
import '../common/reusable_text.dart';
import '../models/person_model.dart';

class AuthController extends GetxController {
  Rx<Uint8List?> image = Rx<Uint8List?>(null);
  late Rx<File?> _pickFile;

  File? get pickFile => _pickFile.value;
  RxInt index = 0.obs;
  Rx<File> selectedImage = File('').obs;

  void changeIndex(int value) {
    index.value = value;
  }

  Future<void> pickImage() async {
    final imageProfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageProfile != null) {
      image.value = await imageProfile.readAsBytes();
      _pickFile = Rx<File?>(File(imageProfile.path));
      selectedImage.value = File(imageProfile.path);
    } else {
      Get.snackbar('No image selected', 'select image to proceed');
    }
  }

  Future<String> uploadImage() async {
    try {
      Reference reference = firebaseStorage
          .ref()
          .child('profileImage/${firebaseAuth.currentUser!.uid}.jpeg');
      UploadTask uploadTask = reference.putData(image.value!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  }

  void createUser(
    String willingToRelocate,
    int age,
    double height,
    weight,
    String password,
    email,
    name,
    phoneNumber,
    city,
    country,
    profileHeader,
    lookingForInPartner,
    bodyType,
    drink,
    smoke,
    maritalStatus,
    profession,
    employmentStatus,
    livingSituation,
    relationYouAreLookingFor,
    nationality,
    education,
    languageSpoken,
    religion,
    ethnicity,
      File profileImg,
    BuildContext context,
  ) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Center(
                child: CupertinoActivityIndicator(),
              ),
              content: SingleChildScrollView(
                  child: Center(
                child: reusableText(text: 'Please wait. . .'),
              )),
            );
          });
      firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String imageUrl = await uploadImage();
        // Reference reference = firebaseStorage
        //     .ref()
        //     .child('profileImage/${value.user!.uid}.jpeg');
        // await reference.putFile(selectedImage.value);
        // String downloadUrl = await reference.getDownloadURL();
        PersonModel personModel = PersonModel(
          email: email,
          password: password,
          name: name,
          age: age,
          phoneNumber: phoneNumber,
          city: city,
          country: country,
          profileHeader: profileHeader,
          lookingForInPartner: lookingForInPartner,
          height: height,
          weight: weight,
          bodyType: bodyType,
          drink: drink,
          smoke: smoke,
          maritalStatus: maritalStatus,
          profession: profession,
          employmentStatus: employmentStatus,
          livingSituation: livingSituation,
          willingToRelocate: willingToRelocate,
          relationYouAreLookingFor: relationYouAreLookingFor,
          nationality: nationality,
          education: education,
          languageSpoken: languageSpoken,
          religion: religion,
          ethnicity: ethnicity,
          profilePic: imageUrl,
          uid: firebaseAuth.currentUser!.uid,
        );
        firebaseFirestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .set(personModel.toMap());
        Get.snackbar('Success', 'User created successfully');
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      }).onError((error, stackTrace) {
        Get.snackbar('Failed', error.toString());
        print(stackTrace);
        Navigator.pop(context);
      });
    } catch (e, stackTrace) {
      print(stackTrace);
      Get.snackbar('Failed to create user', e.toString());
      Navigator.pop(context);
    }
  }

  loggedInUser(String email , password, BuildContext context) async {
    if(email.isNotEmpty && password.isNotEmpty) {
      try{
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
          Get.snackbar('Success', 'User logged in successfully!');
        });
      }catch(e) {
        Get.snackbar('Failed', 'Email or password is not correct');
        if (kDebugMode) {
          print('Failed $e');
        }
      }
    }else{
      Get.snackbar('Empty credentials', 'Please fill out all fields');
    }
  }
}
