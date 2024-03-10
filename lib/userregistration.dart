import 'package:dmythra2/authent.dart';
import 'package:dmythra2/userhome.dart';
import 'package:flutter/material.dart';

class UserRegisteration extends StatefulWidget {
  const UserRegisteration({super.key});

  @override
  State<UserRegisteration> createState() => _UserRegisterationState();
}

class _UserRegisterationState extends State<UserRegisteration> {
  BackendServices backendServices = BackendServices();
  TextEditingController udidController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController disabilityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final signupkey = GlobalKey<FormState>();

  clearfield(){udidController.clear();
  usernameController.clear();
  disabilityController.clear();
  emailController.clear();
  passwordController.clear();
  dobController.clear();
  aadharController.clear();
  phoneController.clear();
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
              image: AssetImage('assets/registeration.png'),
              fit: BoxFit.cover,
            )),
            child: Form(
              key: signupkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration( hintText: 'UD ID',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: udidController,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Name',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: usernameController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Disability type',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: disabilityController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Date of birth',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
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
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Email ID',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: emailController,
                              onTap: () {},
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Password',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
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
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Aadhar no',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
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
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2,color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue.shade50),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Phone no',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return '*required field';
                                }else{
                                  return null;
                                }
                              },
                              controller: phoneController,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (signupkey.currentState!.validate()) {

                                  backendServices.signup(
                                    emailController.text,
                                    passwordController.text,
                                    udidController.text,
                                    usernameController.text,
                                    disabilityController.text,
                                    dobController.text,
                                    int.parse(aadharController.text),
                                    int.parse(phoneController.text),
                                  ).then((value) => Navigator.of(context).pop()).then((value) => clearfield());
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
                        ])
                  ]),
                ),
              ),
            )));
  }
}
