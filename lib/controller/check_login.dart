import 'package:dmythra2/authent.dart';
import 'package:dmythra2/orghome.dart';
import 'package:dmythra2/sponserhome.dart';
import 'package:dmythra2/startingpage.dart';
import 'package:dmythra2/userhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

checkLoginStatus(context) async {

  BackendServices backend =BackendServices();
  bool isLoggedIn = await getLoggedPrefer();
  String type=await getLoggedType();
  if (isLoggedIn == true) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    if(type=="USER"){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>UserHome()), (route) => false);

    }else if(type=="SPONSOR"){
      Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context)=>SponsorHome()), (route) => false);
    }else {
      Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context)=>OrganizationHome()), (route) => false);
    }




    // await storenstence.getloginUSer(uid, context);
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Startingpage()));
  }
}

Future<bool> getLoggedPrefer() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getBool('isLoggedIn') ?? false;
}
Future<String> getLoggedType() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString('Usertype'));
  return prefs.getString('Usertype') ?? "";
}

void setLoginPrefertrue(usertype) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
  await prefs.setString("Usertype", usertype);
  getLoggedPrefer();
  getLoggedType();
}

void setLoginPreferfalse() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  await prefs.setString('Usertype', "");
  // await prefs.re("Usertype");
  getLoggedPrefer();
  getLoggedType();
}