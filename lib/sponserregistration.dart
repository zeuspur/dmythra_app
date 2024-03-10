import 'package:dmythra2/authent.dart';
import 'package:dmythra2/sponserhome.dart';
import 'package:flutter/material.dart';

class SponserRegistration extends StatefulWidget {
  const SponserRegistration({super.key});

  @override
  State<SponserRegistration> createState() => _SponserRegistrationState();
}

class _SponserRegistrationState extends State<SponserRegistration> {
  BackendServices backendServices = BackendServices();
  TextEditingController sponsornameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController phoneContoller = TextEditingController();
  final signupkey = GlobalKey<FormState>();

  clearfield(){
  emailController.clear();
  passwordController.clear();
  dobController.clear();
  aadharController.clear();
  phoneContoller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          // title: Text(backendServices.userModel.username),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/spnsr.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  Form(
                    key: signupkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Name',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: sponsornameController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Date of birth',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: dobController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Email ID',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Password',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Aadhar no',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: aadharController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Phone no',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*required field';
                                } else {
                                  return null;
                                }
                              },
                              controller: phoneContoller,
                            ),
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {

                                if (signupkey.currentState!.validate()) {
                                  backendServices.sponsorSignUp(
                                    emailController.text,
                                    passwordController.text,
                                    sponsornameController.text,
                                    dobController.text,
                                    int.parse(aadharController.text),
                                    int.parse(phoneContoller.text),

                                  ) .then((value) => Navigator.of(context).pop()).then((value) => clearfield());
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
                ]),
              ),
            )));
  }
}
