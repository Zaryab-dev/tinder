import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/reusable_text.dart';
import 'package:tinder/controllers/favorite_controller.dart';
import 'package:tinder/controllers/like_controller.dart';

import '../../common/global_var.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  final likeController = Get.put(LikeController());
  List<String> likeSentList = [];
  List<String> likeReceivedList = [];
  List likesList = [];
  bool isClicked = true;

  void getLikeListKeys() async {
    if (isClicked) {
      var favoriteSentDocument = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('likeSent')
          .get();
      for (int i = 0; i < favoriteSentDocument.docs.length; i++) {
        likeSentList.add(favoriteSentDocument.docs[i].id);
      }
      print('like sent list $likeSentList');
      getKeysDataFromUserCollection(likeSentList);
    }else{
      var favoriteReceiveDocument = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('likeReceived')
          .get();
      for (int i = 0; i < favoriteReceiveDocument.docs.length; i++) {
        likeReceivedList.add(favoriteReceiveDocument.docs[i].id);
      }
      print('like receive list $likeSentList');
      getKeysDataFromUserCollection(likeReceivedList);
    }
  }

  void getKeysDataFromUserCollection(List<String> keysList) async{
    var allUsersDocument = await firebaseFirestore.collection('users').get();

    for(int i = 0; i<allUsersDocument.docs.length; i++) {
      for(int k = 0; k<keysList.length; k++) {
        if((allUsersDocument.docs[i].data()['uid']) == keysList[k]) {
          likesList.add(allUsersDocument.docs[i].data());
        }
      }
    }setState(() {
      likesList;
    });
  }

  @override
  void initState() {
    getLikeListKeys();
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
              likesList.clear();
              likesList = [];
              likeReceivedList.clear();
              likeReceivedList = [];
              likeSentList.clear();
              likeSentList = [];
              isClicked = true;
              getLikeListKeys();

            }, child:
              Text('My likes',style: TextStyle(color: isClicked ? CupertinoColors.systemPink : CupertinoColors.systemGrey),)
            ),
            reusableText(text: '   ||   '),
            TextButton(onPressed: () {
              likesList.clear();
              likesList = [];
              likeReceivedList.clear();
              likeReceivedList = [];
              likeSentList.clear();
              likeSentList = [];
              isClicked = false;
              getLikeListKeys();

            }, child: Text('People liked me',style: TextStyle(color: isClicked? Colors.grey : CupertinoColors.systemPink),)),
          ],
        ),
      ),
      body: Center(
        child: likesList.isEmpty ?  const Center(
          child: Icon(Icons.person_off_outlined,size: 40,),
        ) :
        SizedBox(
          height: size.height,
          width: size.width,
          child: ListView.builder(
              itemCount: likesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 32,
                      backgroundColor: CupertinoColors.systemGrey3,
                      backgroundImage: NetworkImage(likesList[index]['profilePic']),
                    ),
                    title: Text(likesList[index]['name']),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
