import 'package:dmythra2/organizationlogin.dart';
import 'package:dmythra2/sponserlogin.dart';
import 'package:dmythra2/userlogin.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 250,
                    width: 250,
                  ),
                  Text('Login as',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin(),),);
                    },
                    child: Container(
                      alignment:Alignment.center,
                      height: 50,
                      width: 250,
                      child: Text(
                        'User',
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrganizationLogin(),),);
                  },
                    child: Container(
                      alignment:Alignment.center,
                      height: 50,
                      width: 250,
                      child: Text(
                        'Organization',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SponserLogin(),),);
                  },
                    child: Container(
                      alignment:Alignment.center,
                      height: 50,
                      width: 250,
                      child: Text(
                        'Sponsor',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //ElevatedButton(onPressed: (){}, child: Text('User',style: TextStyle(fontWeight: FontWeight.normal)),)
          ],
        ),
      ),
    );
  }
}
