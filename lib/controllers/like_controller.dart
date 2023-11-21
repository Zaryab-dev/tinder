import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tinder/common/global_var.dart';

class LikeController extends GetxController {
  void sendAndReceiveLike(String toUserId, senderName) async {
    var document = await firebaseFirestore
        .collection('users')
        .doc(toUserId)
        .collection('likeReceived')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    if (document.exists) {
      firebaseFirestore
          .collection('users')
          .doc(toUserId)
          .collection('likeReceived')
          .doc(firebaseAuth.currentUser!.uid)
          .delete();

      firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('likeSent')
          .doc(toUserId)
          .delete();
    } else {
      firebaseFirestore
          .collection('users')
          .doc(toUserId)
          .collection('likeReceived')
          .doc(firebaseAuth.currentUser!.uid)
          .set({});

      firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('likeSent')
          .doc(toUserId)
          .set({});
      sendNotificationToUser(toUserId, 'like', senderName);

    }
    update();
  }
  sendNotificationToUser(receiverID, feature, senderName) async{
    String userDeviceToken = '';
    await firebaseFirestore
        .collection('users')
        .doc(receiverID)
        .get()
        .then((value) {
      if (value.data()!['userDeviceToken'] != null) {
        userDeviceToken = value.data()!['userDeviceToken'].toString();
      }
    });
    notificationFormat(userDeviceToken, receiverID, feature, senderName);
  }
  notificationFormat(userDeviceToken, receiverID, feature, senderName) {
    Map<String, String> headerNotification = {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAvo2IRys:APA91bH6bJyNA9m_qpiW2rWNg1i3bouPtdH1c9-9Ee9exccBHkBosGx2w_xZ4veUeOxFYjst4MUd1o7OYM_ADCDJuecdkqBw55TjsN0WHvyvg9NWGivbWMn86G0TlsI2I6GdPZAa5IkI'
    };
    Map bodyNotification = {
      'body': 'you have new $feature from $senderName. click to see',
      'title': 'New $feature'
    };
    Map dataMap = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'userID': receiverID,
      'senderID': firebaseAuth.currentUser!.uid,
    };
    Map notificationOfficialFormat = {
      'notification': bodyNotification,
      'data': dataMap,
      'priority': 'high',
      'to': userDeviceToken,
    };
    http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: headerNotification,
      body: jsonEncode(notificationOfficialFormat),
    );
  }

}
