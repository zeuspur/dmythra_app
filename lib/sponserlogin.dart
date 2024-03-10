import 'package:dmythra2/authent.dart';
import 'package:dmythra2/sponserhome.dart';
import 'package:dmythra2/sponserregistration.dart';
import 'package:dmythra2/sponsor_forgetpassword.dart';
import 'package:flutter/material.dart';
class SponserLogin extends StatefulWidget {
  const SponserLogin({super.key});

  @override
  State<SponserLogin> createState() => _SponserLoginState();
}

class _SponserLoginState extends State<SponserLogin> {
  BackendServices backendServices = BackendServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final sponsorloginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sponsorlogin.png'),
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
              Form(
                key: sponsorloginkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 160.0),
                    //   child: Text(
                    //     'Username',
                    //     style: TextStyle(fontSize: 20),
                    //     // style: TextStyle(
                    //     //      fontSize: 20),
                    //   ),
                    // ),
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
                        decoration: InputDecoration( hintText: 'Email ID',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*required field';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 158.0),
                        //   child: Text(
                        //     'Password',
                        //     style: TextStyle(fontSize: 20),
                        //     // style: TextStyle(
                        //     //      fontSize: 20),
                        //   ),
                        // ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightBlue.shade50),
                          child: TextFormField(
                            decoration: InputDecoration( hintText: 'Password',border: UnderlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.only(left: 30.0),),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*required field';
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: InkWell(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sponsor_ForgetPassword(),
                          ),
                        );
                      },
                        child: Text(
                          'Forget Password?',
                          style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: InkWell(onTap: () {
                        if(sponsorloginkey.currentState!.validate()){  backendServices.userLogin(emailController.text,
                            passwordController.text,
                            context, 'sponsors', SponsorHome());}
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
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        height: 15,
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: InkWell(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SponserRegistration(),
                          ),
                        );
                      },
                          child: Text('Register now')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
