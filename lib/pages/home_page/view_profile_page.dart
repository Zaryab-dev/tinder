import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/reusable_text.dart';
import 'package:tinder/controllers/favorite_controller.dart';

import '../../common/global_var.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  List<String> favoriteSentList = [];
  List<String> favoriteReceivedList = [];
  List favoritesList = [];
  bool isClicked = true;

  void getFavoriteSentListKeys() async {
    if (isClicked) {
      var favoriteSentDocument = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('viewSent')
          .get();
      for (int i = 0; i < favoriteSentDocument.docs.length; i++) {
        favoriteSentList.add(favoriteSentDocument.docs[i].id);
      }
      print('view list $favoriteSentList');
      getKeysDataFromUserCollection(favoriteSentList);
    } else {
      var favoriteReceiveDocument = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('viewReceived')
          .get();
      for (int i = 0; i < favoriteReceiveDocument.docs.length; i++) {
        favoriteReceivedList.add(favoriteReceiveDocument.docs[i].id);
      }
      if (kDebugMode) {
        print('view receive list $favoriteReceivedList');
      }
      getKeysDataFromUserCollection(favoriteReceivedList);
    }
  }

  void getKeysDataFromUserCollection(List<String> keysList) async{
    var allUsersDocument = await firebaseFirestore.collection('users').get();

    for(int i = 0; i<allUsersDocument.docs.length; i++) {
      for(int k = 0; k<keysList.length; k++) {
        if((allUsersDocument.docs[i].data()['uid']) == keysList[k]) {
          favoritesList.add(allUsersDocument.docs[i].data());
          if (kDebugMode) {
            print('complete details $favoritesList');
          }
        }
      }
    }
    setState(() {
      favoritesList;
    });
  }

  @override
  void initState() {
    getFavoriteSentListKeys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              favoriteSentList.clear();
              favoriteSentList = [];
              favoriteReceivedList.clear();
              favoriteReceivedList = [];
              favoritesList.clear();
              favoritesList = [];
              isClicked = true;
              getFavoriteSentListKeys();

            }, child: Text('People visited by you',style: TextStyle(color: isClicked ? CupertinoColors.systemPink : CupertinoColors.systemGrey),)),
            reusableText(text: '   ||   '),
            TextButton(onPressed: () {
                favoriteSentList.clear();
                favoriteSentList = [];
                favoriteReceivedList.clear();
                favoriteReceivedList = [];
                favoritesList.clear();
                favoritesList = [];
                isClicked = false;
                getFavoriteSentListKeys();

              }, child: Text('People visit your profile',style: TextStyle(color: isClicked ? Colors.grey : CupertinoColors.systemPink),))
          ],
        ),
      ),
      body: Center(
        child: favoritesList.isEmpty ?  const Center(
          child: Icon(Icons.person_off_outlined,size: 40,),
        ) :
        SizedBox(
          height: size.height,
          width: size.width,
          child: ListView.builder(
              itemCount: favoritesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 32,
                      backgroundColor: CupertinoColors.systemGrey3,
                      backgroundImage: NetworkImage(favoritesList[index]['profilePic']),
                    ),
                    title: Text(favoritesList[index]['name']),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
