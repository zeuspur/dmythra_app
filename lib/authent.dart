import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmythra2/controller/check_login.dart';
import 'package:dmythra2/model/help_model.dart';
import 'package:dmythra2/model/media_model.dart';
import 'package:dmythra2/model/medicine_model.dart';
import 'package:dmythra2/model/user_model.dart';
import 'package:dmythra2/model/sponsor_model.dart';
import 'package:dmythra2/orghome.dart';
import 'package:dmythra2/user_forgetpassword.dart';
import 'package:dmythra2/userhome.dart';
import 'package:dmythra2/userlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dmythra2/model/user_post_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BackendServices {
  String orgID = 'dmythra@123';
  String orgpass = '123456';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//------------------user------------------------------
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  Future<void> saveUser(
    String userID,
    String udid,
    String username,
    String disability,
    String dob,
    String email,
    int aadhar,
    int phone,
  ) async {
    _userModel = UserModel(
      userid: userID,
      udid: udid,
      username: username,
      disability: disability,
      dob: dob,
      email: email,
      aadhar: aadhar,
      phone: phone,
    );

    await firebaseFirestore
        .collection('users')
        .doc(userID)
        .set(_userModel!.toMap());
  }
////////
  Future<void> signup(
    emailAddress,
    password,
    String udid,
    String username,
    String disability,
    String dob,
    int aadhar,
    int phone,
  ) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      saveUser(
        firebaseAuth.currentUser!.uid,
        udid,
        username,
        disability,
        dob,
        emailAddress,
        aadhar,
        phone,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> userLogin(
    String userEmail,
    String userPassword,
    context,
    String collectionName,
    pageName,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      final user = firebaseAuth.currentUser;
      final emailVerified = user!.emailVerified;
      print('Verification: $emailVerified');

      if (emailVerified == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("please verify email")));
      } else {
        CollectionReference collection =
            firebaseFirestore.collection(collectionName);
        var userQuery = await collection.doc(user.uid).get();
        if (userQuery.exists) {
        if(collectionName=="sponsors"){
          setLoginPrefertrue("SPONSOR");
        }else if(collectionName=="users"){
          setLoginPrefertrue("USER");
        }

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => pageName,
              ),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('This email is not registered')));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  String? _uid;
  String get uid => _uid!;

  Future fetchUserData() async {
    try {
      print('Fethcing data _________');
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _userModel = UserModel(
          userid: snapshot['userid'],
          udid: snapshot['udid'],
          username: snapshot['username'],
          disability: snapshot['disability'],
          dob: snapshot['dob'],
          email: snapshot['email'],
          aadhar: snapshot['aadhar'],
          phone: snapshot['phone'],
        );
        _uid = userModel.userid;
        print('Fethcing completed _________');
      });
    } catch (e) {
      print('Fetching user failed : $e');
    }
  }

  //------------------sponsor------------------------------------

  SponsorModel? _sponsorModel;
  SponsorModel get sponsorModel => _sponsorModel!;
  Future<void> saveSponsor(
    String sponsorID,
    String sponsorName,
    String dob,
    String email,
    int aadhar,
    int phone,
  ) async {
    _sponsorModel = SponsorModel(
      sponsorid: sponsorID,
      sponsorname: sponsorName,
      dob: dob,
      email: email,
      aadhar: aadhar,
      phone: phone,
    );

    await firebaseFirestore
        .collection('sponsors')
        .doc(sponsorID)
        .set(_sponsorModel!.toMap());
  }

  Future sponsorSignUp(
    emailAddress,
    password,
    String sponsorname,
    String dob,
    int aadhar,
    int phone,
  ) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = firebaseAuth.currentUser;
      user!.sendEmailVerification();
      saveSponsor(
        firebaseAuth.currentUser!.uid,
        sponsorname,
        dob,
        emailAddress,
        aadhar,
        phone,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email, context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Password reset email sent successfully. Check your inbox.')));

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const UserLogin(),
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } catch (e) {
      print(e);
    }
  }

  String? _sponsorid;
  String get sponsorid => _sponsorid!;

  Future fetchSponsorData() async {
    try {
      print('Fethcing data _________');
      await firebaseFirestore
          .collection('sponsors')
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        _sponsorModel = SponsorModel(
          sponsorid: snapshot['sponsorid'],
          sponsorname: snapshot['sponsorname'],
          dob: snapshot['dob'],
          email: snapshot['email'],
          aadhar: snapshot['aadhar'],
          phone: snapshot['phone'],
        );
        _sponsorid = sponsorModel.sponsorid;
        print('Fethcing completed _________');
      });
    } catch (e) {
      print('Fetching user failed : $e');
    }
  }
  acceptRequest(type,selectedId)async {
    final db = FirebaseFirestore.instance;
    if (type == "Food") {
      await db.collection("Food Help").doc(selectedId).update(
          {"isAccepted": true});
    } else if (type == "Fund") {
      await db.collection("Fund Help").doc(selectedId).update(
          {"isAccepted": true});

    } else if (type == "Clothes") {
      await db.collection("Clothes Help").doc(selectedId).update(
          {"isAccepted": true});

    } else if (type == "Transportation") {
      await db.collection("Transportation Help").doc(selectedId).update(
          {"isAccepted": true});

    } else if (type == "Other") {
      await db.collection("Other Help").doc(selectedId).update(
          {"isAccepted": true});

    }else if(type=="Medicine"){
      await db.collection("medicine Help").doc(selectedId).update(
          {"isAccepted": true});

    }

  }
  deleteRequest(type,selectedId)async {
    final db = FirebaseFirestore.instance;
    if (type == "Food") {
      await db.collection("Food Help").doc(selectedId).delete();
    } else if (type == "Fund") {
      await db.collection("Fund Help").doc(selectedId).delete();

    } else if (type == "Clothes") {
      await db.collection("Clothes Help").doc(selectedId).delete();

    } else if (type == "Transportation") {
      await db.collection("Transportation Help").doc(selectedId).delete();

    } else if (type == "Other") {
      await db.collection("Other Help").doc(selectedId).delete();

    }else if(type=="Medicine"){
      await db.collection("medicine help").doc(selectedId).delete();

    }

  }

  //-------------------------Activity(post)------------------------------------

  PostModel? _postModel;
  PostModel get postModel => _postModel!;

  Future<String> storeImagetoStorge(String ref, File file) async {
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask =
        firebaseStorage.ref().child(ref).putFile(file, metadata);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    log(downloadURL);
    return downloadURL;
  }

  File? postPic;

  Future<File> pickPostPhoto(context) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        postPic = File(pickedImage.path);
      }
    } catch (e) {
      print(e);
    }
    return postPic!;
  }

  Future<void> selectPostPic(context) async {
    postPic = await pickPostPhoto(context);
  }

  uploadPostPhoto(File postPhoto, String postName) async {
    await storeImagetoStorge(
            'Users posts/${firebaseAuth.currentUser!.uid}/Post pics/$postName/',
            postPhoto)
        .then((value) async {
      postModel.postPic = value;

      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('posts')
          .doc(postModel.postid);
      await docRef.update({'postPic': value});

      DocumentReference publicDocRef =
          firebaseFirestore.collection('users posts').doc(postModel.postid);
      await publicDocRef.update({'postPic': value});
    });
    _postModel = postModel;
    print('Pic uploaded successfully');
  }

  Future<void> savePost(
    String postPic,
    String postBio,
    String username,
  ) async {
    String postID = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('posts')
        .doc()
        .id;

    _postModel = PostModel(
        postid: postID,
        postPic: postPic,
        postBio: postBio,
        userid: firebaseAuth.currentUser!.uid,
        username: username);

    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('posts')
        .doc(postID)
        .set(_postModel!.toMap(postID));
    await firebaseFirestore
        .collection('users posts')
        .doc(postID)
        .set(_postModel!.toMap(postID));
  }

  List<PostModel> postsList = [];
  PostModel? posts;
  Future<void> fetchPosts() async {
    try {
      postsList.clear();
      CollectionReference postRef = firebaseFirestore.collection('users posts');
      QuerySnapshot postsSnapshot = await postRef.get();

      for (var doc in postsSnapshot.docs) {
        String postid = doc['postid'];
        String postPic = doc['postPic'];
        String postBio = doc['postBio'];
        String userid = doc['userid'];
        String username = doc['username'];

        posts = PostModel(
          postPic: postPic,
          postBio: postBio,
          userid: userid,
          username: username,
        );
        postsList.add(posts!);
      }
    } catch (e) {
      print('posts fetching failed : $e');
    }
  }

  //------------------------HELP--------------------------------------------

  HelpModel? _helpModel;
  HelpModel get helpModel => _helpModel!;

  Future<void> saveHelp(
    String collectionName,
    String helpType,
    int helpNumber,
  ) async {
    String helpID = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection(collectionName)
        .doc()
        .id;

    _helpModel = HelpModel(
        helpid: helpID,
        helpType: helpType,
        helpNumber: helpNumber,
        userid: firebaseAuth.currentUser!.uid,
        isAccepted: false);

    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection(collectionName)
        .doc(helpID)
        .set(_helpModel!.toMap(helpID));
    await firebaseFirestore
        .collection(collectionName)
        .doc(helpID)
        .set(_helpModel!.toMap(helpID));
  }

  List<Map<String, dynamic>> requestList = [];
  List<Map<String, dynamic>> acceptedrequestList = [];
  List<String> collections = [
    'Food Help',
    'Fund Help',
    'Clothes Help',
    'Transportation Help',
    'Other Help'
  ];

  Future<void> fetchHelps() async {
    try {
      requestList.clear();
      for (String collectionName in collections) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await firebaseFirestore
                .collection(collectionName)
                .where('isAccepted', isEqualTo: false)
                .get();
        requestList.addAll(querySnapshot.docs.map((doc) => doc.data()));
      }
    } catch (e) {
      print('Fetching help failed : $e');
    }
  }

  Future<void> fetchAcceptedHelps() async {
    try {
      acceptedrequestList.clear();
      for (String collectionName in collections) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await firebaseFirestore
                .collection(collectionName)
                .where('isAccepted', isEqualTo: true)
                .get();
        acceptedrequestList.addAll(querySnapshot.docs.map((doc) => doc.data()));
      }
    } catch (e) {
      print('Fetching help failed : $e');
    }
  }

  //--------------------FETCH SPONSOR-------------------------
  List<SponsorModel> sponsorsList = [];
  SponsorModel? sponsors;
  Future<void> fetchSponsor() async {
    try {
      sponsorsList.clear();
      CollectionReference sponsorsRef =
          firebaseFirestore.collection('sponsors');
      QuerySnapshot sponsorSnapshot = await sponsorsRef.get();

      for (var doc in sponsorSnapshot.docs) {
        String sponsorid = doc['sponsorid'];
        String sponsorname = doc['sponsorname'];
        String dob = doc['dob'];
        String email = doc['email'];
        int aadhar = doc['aadhar'];
        int phone = doc['phone'];

        sponsors = SponsorModel(
          sponsorid: sponsorid,
          sponsorname: sponsorname,
          dob: dob,
          email: email,
          aadhar: aadhar,
          phone: phone,
        );
        sponsorsList.add(sponsors!);
      }
    } catch (e) {
      print('Sponsors fetching failed : $e');
    }
  }

  //-------------------SAVE / FETCH MEDIA=---------------------------------------------4

  MediaModel? _mediaModel;
  MediaModel get mediaModel => _mediaModel!;
  Future<void> saveMedia(
    String mediaTitle,
    String mediaType,
    String mediaLink,
    String collectionName,
  ) async {
    final docs = await firebaseFirestore.collection(collectionName).doc();
    _mediaModel = MediaModel(
        mediaid: docs.id,
        mediaTitle: mediaTitle,
        mediaType: mediaType,
        mediaLink: mediaLink);
    docs.set(_mediaModel!.toMap(docs.id));
  }

  List<MediaModel> mediaList = [];
  MediaModel? medias;

  Future<void> fetchMedias(String collectionName) async {
    try {
      mediaList.clear();
      CollectionReference mediaRef =
          firebaseFirestore.collection(collectionName);
      QuerySnapshot mediaSnapshot = await mediaRef.get();
      for (var doc in mediaSnapshot.docs) {
        String mediaid = doc['mediaid'];
        String mediaTitle = doc['mediaTitle'];
        String mediaType = doc['mediaType'];
        String mediaLink = doc['mediaLink'];

        medias = MediaModel(
          mediaid: mediaid,
          mediaTitle: mediaTitle,
          mediaType: mediaType,
          mediaLink: mediaLink,
        );
        mediaList.add(medias!);
      }
    } catch (e) {
      print('fetch media failed : $e');
    }
  }

  void launchYouTubeVideo(String videoId) async {
    String url = videoId;

    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      print('condition true--------------------');
      throw Exception('Could not launch $url');
      // await launchUrl(Uri.parse(url),mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }

  //---------------------------MEDICINE-----------------------------------------
  MedicineModel? _medicineModel;
  MedicineModel get medicineModel => _medicineModel!;

  Future<void> saveMedicine(
    String prescription,
    int phone,
    String description,
  ) async {
    String medicineID = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('medicine help')
        .doc()
        .id;

    _medicineModel = MedicineModel(
        medicineid: medicineID,
        prescription: prescription,
        phone: phone,
        description: description,
        userID: firebaseAuth.currentUser!.uid,
        isAccepted: false);

    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('medicine help')
        .doc(medicineID)
        .set(_medicineModel!.toMap(medicineID));

    await firebaseFirestore
        .collection('medicine help')
        .doc(medicineID)
        .set(_medicineModel!.toMap(medicineID));
  }

  uploadPrescription(File postPhoto, String postName) async {
    await storeImagetoStorge(
            'Users posts/${firebaseAuth.currentUser!.uid}/Prescription pics/$postName/',
            postPhoto)
        .then((value) async {
      medicineModel.prescription = value;

      DocumentReference docRef = firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('medicine help')
          .doc(medicineModel.medicineid);
      await docRef.update({'prescription': value});

      DocumentReference publicDocRef = firebaseFirestore
          .collection('medicine help')
          .doc(medicineModel.medicineid);
      await publicDocRef.update({'prescription': value});
    });
    _medicineModel = medicineModel;
    print('Pic uploaded successfully');
  }

  void callingFunction(String phone) async {
    FlutterPhoneDirectCaller.callNumber(phone);
    log('calling $phone');
  }

  List<MedicineModel> medicineList = [];
  MedicineModel? medicines;
  Future<void> fetchMedicines() async {
    try {
      medicineList.clear();
      CollectionReference medicinesRef =
          firebaseFirestore.collection('medicine help');
      QuerySnapshot medicineSnapshot =
          await medicinesRef.where('isAccepted', isEqualTo: false).get();

      for (var doc in medicineSnapshot.docs) {
        String medicineid = doc['medicineid'];
        String prescription = doc['prescription'];
        int phone = doc['phone'];
        String description = doc['description'];
        String userID = doc['userID'];
        bool isAccepted = doc['isAccepted'];

        medicines = MedicineModel(
          medicineid: medicineid,
          prescription: prescription,
          phone: phone,
          description: description,
          userID: userID,
          isAccepted: isAccepted,
        );
        medicineList.add(medicines!);
      }
    } catch (e) {
      print('Medicines fetching failed : $e');
    }
  }

  //------------------------------------ORGANIZATION----------------------------
  void orgLogin(
    String id,
    String pass,
    context,
  ) {
    if (id == orgID && pass == orgpass) {
      setLoginPrefertrue("ORGA");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OrganizationHome(),
      ));
    } else {
      print('invalid username or email');
    }
  }

  List<UserModel> usersList = [];
  UserModel? users;
  Future<void> fetchUsers() async {
    try {
      usersList.clear();
      CollectionReference usersRef = firebaseFirestore.collection('users');
      QuerySnapshot usersSnapshot = await usersRef.get();

      for (var doc in usersSnapshot.docs) {
        String userid = doc['userid'];
        String udid = doc['udid'];
        String username = doc['username'];
        String disability = doc['disability'];
        String dob = doc['dob'];
        String email = doc['email'];
        int aadhar = doc['aadhar'];
        int phone = doc['phone'];

        users = UserModel(
          userid: userid,
          udid: udid,
          username: username,
          disability: disability,
          dob: dob,
          email: email,
          aadhar: aadhar,
          phone: phone,
        );
        usersList.add(users!);
      }
    } catch (e) {
      print('Users fetching failed : $e');
    }
  }

  Future<void> deleteUser(String collectionName, String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(userId)
          .delete();
      print('User deleted successfully');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
 //-----------------------------------------------------------------
 sponsoracceptRequest(type,selectedId)async {
   final db = FirebaseFirestore.instance;
   if (type == "Food") {
     await db.collection("Food Help").doc(selectedId).update(
         {"isAccepted": true});
   } else if (type == "Fund") {
     await db.collection("Fund Help").doc(selectedId).update(
         {"isAccepted": true});

   } else if (type == "Clothes") {
     await db.collection("Clothes Help").doc(selectedId).update(
         {"isAccepted": true});

   } else if (type == "Transportation") {
     await db.collection("Transportation Help").doc(selectedId).update(
         {"isAccepted": true});

   } else if (type == "Other") {
     await db.collection("Other Help").doc(selectedId).update(
         {"isAccepted": true});

   }else if(type=="Medicine"){
     await db.collection("medicine Help").doc(selectedId).update(
         {"isAccepted": true});

   }

}
  sponsordeleteRequest(type,selectedId)async {
    final db = FirebaseFirestore.instance;
    if (type == "Food") {
      await db.collection("Food Help").doc(selectedId).delete();
    } else if (type == "Fund") {
      await db.collection("Fund Help").doc(selectedId).delete();

    } else if (type == "Clothes") {
      await db.collection("Clothes Help").doc(selectedId).delete();

    } else if (type == "Transportation") {
      await db.collection("Transportation Help").doc(selectedId).delete();

    } else if (type == "Other") {
      await db.collection("Other Help").doc(selectedId).delete();

    }else if(type=="Medicine"){
      await db.collection("medicine help").doc(selectedId).delete();

    }

  }
  //--------------------------------------------------------all sponser and user
  addtoUserss(userId,type,email)async{
    final db = FirebaseFirestore.instance;
   await db.collection("All User").doc().set({"id":userId,"type":type,"email":email});

  }

}
