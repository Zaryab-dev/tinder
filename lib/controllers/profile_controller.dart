
import 'package:get/get.dart';
import 'package:tinder/common/global_var.dart';

class ProfileController extends GetxController {
  RxString username = ''.obs;
  RxString profilePic = ''.obs;
  RxString country = ''.obs;
  RxString relationYouAreLookingFor = ''.obs;
  RxInt age = 0.obs;
  void getUserData() async {
    try{
     await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).get().then((value) {
        if(value.exists) {
         var userData = value.data();
         username.value = userData!['name'];
         profilePic.value = userData['profilePic'];
         age.value = userData['age'];
         country.value = userData['country'];
         relationYouAreLookingFor.value = userData['relationYouAreLookingFor'];
        }
      });
    }catch(e) {
      Get.snackbar('Failed to load data', e.toString());
    }
  }
  @override
  void onReady() {
    getUserData();
    super.onReady();
  }
}