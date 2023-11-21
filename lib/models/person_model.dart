import 'package:cloud_firestore/cloud_firestore.dart';

class PersonModel {
  String email;
  String password;
  String name;
  int age;
  String phoneNumber;
  String city;
  String country;
  String profileHeader;
  String lookingForInPartner;
  double height;
  double weight;
  String bodyType;
  String drink;
  String smoke;
  String maritalStatus;
  String profession;
  String employmentStatus;
  String livingSituation;
  String willingToRelocate;
  String relationYouAreLookingFor;
  String nationality;
  String education;
  String languageSpoken;
  String religion;
  String ethnicity;
  String profilePic;
  String uid;

  PersonModel({
    required this.email,
    required this.password,
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.city,
    required this.country,
    required this.profileHeader,
    required this.lookingForInPartner,
    required this.height,
    required this.weight,
    required this.bodyType,
    required this.drink,
    required this.smoke,
    required this.maritalStatus,
    required this.profession,
    required this.employmentStatus,
    required this.livingSituation,
    required this.willingToRelocate,
    required this.relationYouAreLookingFor,
    required this.nationality,
    required this.education,
    required this.languageSpoken,
    required this.religion,
    required this.ethnicity,
    required this.profilePic,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'age': age,
      'phoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'profileHeader': profileHeader,
      'lookingForInPartner': lookingForInPartner,
      'height': height,
      'weight': weight,
      'bodyType': bodyType,
      'drink': drink,
      'smoke': smoke,
      'maritalStatus': maritalStatus,
      'profession': profession,
      'employmentStatus': employmentStatus,
      'livingSituation': livingSituation,
      'willingToRelocate': willingToRelocate,
      'relationYouAreLookingFor': relationYouAreLookingFor,
      'nationality': nationality,
      'education': education,
      'languageSpoken': languageSpoken,
      'religion': religion,
      'ethnicity': ethnicity,
      'profilePic': profilePic,
      'uid': uid,
    };
  }

  // Create UserProfile from a Map
  static PersonModel fromMap(DocumentSnapshot snapshot) {
    var map = snapshot.data() as Map<String, dynamic>;
    return PersonModel(
      email: map['email'],
      password: map['password'],
      name: map['name'],
      age: map['age'],
      phoneNumber: map['phoneNumber'],
      city: map['city'],
      country: map['country'],
      profileHeader: map['profileHeader'],
      lookingForInPartner: map['lookingForInPartner'],
      height: map['height'],
      weight: map['weight'],
      bodyType: map['bodyType'],
      drink: map['drink'],
      smoke: map['smoke'],
      maritalStatus: map['maritalStatus'],
      profession: map['profession'],
      employmentStatus: map['employmentStatus'],
      livingSituation: map['livingSituation'],
      willingToRelocate: map['willingToRelocate'],
      relationYouAreLookingFor: map['relationYouAreLookingFor'],
      nationality: map['nationality'],
      education: map['education'],
      languageSpoken: map['languageSpoken'],
      religion: map['religion'],
      ethnicity: map['ethnicity'],
      profilePic: map['profilePic'],
      uid: map['uid'],
    );
  }
}
