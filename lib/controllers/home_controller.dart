
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tinder/common/global_var.dart';
import 'package:tinder/models/person_model.dart';

class HomeController extends GetxController {
  final Rx<List<PersonModel>> _userData = Rx<List<PersonModel>>([]);
  List<PersonModel> get userData => _userData.value;
  RxInt index = 0.obs;
  void changeIndex(int value) {
    index.value = value;
  }

  void getData() {
    try {
      if(chooseCountries == null) {
        _userData.bindStream(firebaseFirestore.collection('users')
            .where('uid', isNotEqualTo: firebaseAuth.currentUser!.uid)
            .snapshots().map((QuerySnapshot querySnapshot) {
          List<PersonModel> userList = [];
          for(var eachProfile in querySnapshot.docs) {
            userList.add(PersonModel.fromMap(eachProfile));
          }
          return userList;
        }));
      }else{
        _userData.bindStream(firebaseFirestore.collection('users')
            .where('uid', isNotEqualTo: firebaseAuth.currentUser!.uid)
            .where('country', isEqualTo: chooseCountries.toString())
            .snapshots().map((QuerySnapshot querySnapshot) {
          List<PersonModel> userList = [];
          for(var eachProfile in querySnapshot.docs) {
            userList.add(PersonModel.fromMap(eachProfile));
          }
          return userList;
        }));
      }
    }catch(e,stackTrace) {
      print(stackTrace);
      print(e.toString());
      Get.snackbar('Failed to retrieve data', e.toString());
    }
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}