import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

FirebaseStorage firebaseStorage = FirebaseStorage.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

List<String> genderList = ['male', 'female', 'other'];
List<String> countryList = ['Pakistan', 'Canada', 'USA', 'UK','Iran','India'];
List<String> ageList = ['18', '20', '25', '30 or above'];
String? chooseGenders;
String? chooseCountries;
String? age;

SendNotificationToUser(receiverID, feature, senderName) async{
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
    'title': '$senderName $feature you'
  };
  Map dataMap = {
    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    'id': '1',
    'status': 'done',
    'senderID': firebaseAuth.currentUser!.uid,
    'userID': receiverID,
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

