import 'package:dmythra2/authent.dart';
import 'package:dmythra2/controller/check_login.dart';
import 'package:dmythra2/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  BackendServices backendServices = BackendServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        // Text('Counselling',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w100),),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: FutureBuilder(
          future: backendServices.fetchUserData(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/userprofile.jpg'),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 5),
                                    color:
                                        Colors.deepOrangeAccent.withOpacity(.2),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: ListTile(
                            title: const Text('Name'),
                            subtitle: Text(backendServices.userModel.username),
                            leading: Icon(CupertinoIcons.person),
                            tileColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 5),
                                    color:
                                        Colors.deepOrangeAccent.withOpacity(.2),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: ListTile(
                            title: const Text('Disability'),
                            subtitle:
                                Text(backendServices.userModel.disability),
                            leading: Icon(Icons.wheelchair_pickup_outlined),
                            tileColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 5),
                                    color:
                                        Colors.deepOrangeAccent.withOpacity(.2),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: ListTile(
                            title: const Text('UD ID'),
                            subtitle: Text(backendServices.userModel.udid),
                            leading: const Icon(CupertinoIcons.info),
                            tileColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 5),
                                    color:
                                        Colors.deepOrangeAccent.withOpacity(.2),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ]),
                          child: ListTile(
                            title: const Text('Email ID'),
                            subtitle: Text(backendServices.userModel.email),
                            leading: Icon(Icons.email_outlined),
                            tileColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          height: 35,
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                  width: 2,
                                ),
                              ),
                              onPressed: () {
                                setLoginPreferfalse();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const loginpage(),
                                    ),
                                    (route) => false);
                                FirebaseAuth.instance.signOut();
                              },
                              child: const Text(
                                "Log Out",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
