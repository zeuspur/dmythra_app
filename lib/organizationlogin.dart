import 'package:dmythra2/authent.dart';
import 'package:dmythra2/orghome.dart';
import 'package:flutter/material.dart';

class OrganizationLogin extends StatefulWidget {
  const OrganizationLogin({super.key});

  @override
  State<OrganizationLogin> createState() => _OrganizationLoginState();
}

class _OrganizationLoginState extends State<OrganizationLogin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  BackendServices backendServices = BackendServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   backgroundColor: Colors.transparent,
      //   // Text('Counselling',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w100),),
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(Icons.arrow_back_ios)),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/orglogin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                child: Image.asset(
                  'assets/logo.png',
                  height: 250,
                  width: 250,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2,color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlue.shade50),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Email ID',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                      controller: username,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlue.shade50),
                        child: TextFormField(
                          decoration: InputDecoration( hintText: 'Password',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                          controller: password,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        backendServices.orgLogin(
                            username.text, password.text, context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
