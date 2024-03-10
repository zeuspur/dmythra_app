import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';
class Sponsor_ForgetPassword extends StatefulWidget {
  const Sponsor_ForgetPassword({super.key});

  @override
  State<Sponsor_ForgetPassword> createState() => _Sponsor_ForgetPasswordState();
}

class _Sponsor_ForgetPasswordState extends State<Sponsor_ForgetPassword> {
  BackendServices backendServices = BackendServices();
  final passResetKey = GlobalKey<FormState>();
  TextEditingController passwordResetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        actions: [

        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/forgetpassword.png'),
              fit: BoxFit.fill,
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 250,top: 300),
                child: Container(
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: Container(
                  width: 290,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.lightBlue.shade50),
                  child: Form(
                    key: passResetKey,
                    child: TextFormField(
                      controller: passwordResetController,
                      validator: (value) {
                        if(value ==  null || value.isEmpty){
                          return '* field is required';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter the Email',
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only(left: 30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120,),
              Positioned(
                bottom: 100.0,
                left: 80.0,
                child: InkWell(
                  onTap: () {
                    if(passResetKey.currentState!.validate()){
                      backendServices.sendPasswordResetEmail(passwordResetController.text, context);
                    }
                  },
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 74.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // Define your desired decoration here
                      borderRadius: BorderRadius.circular(
                          30.0),
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
