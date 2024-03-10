import 'package:dmythra2/loginpage.dart';
import 'package:flutter/material.dart';

class Startingpage extends StatefulWidget {
  const Startingpage({super.key});

  @override
  State<Startingpage> createState() => _StartingpageState();
}

class _StartingpageState extends State<Startingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container(
            height: double.infinity,
            width: double.infinity,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.png'),
                fit: BoxFit.fill,
              ),


            ),
 


        child: Column(
          children: [
            Image.asset('assets/logo.png'),
            Text("Let's make it happen",style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 28,fontFamily: AutofillHints.countryName),)
          ],
        ),
        // Text("Let's make it happen")

        //   Container(
        //     height: double.infinity,
        //     width: double.infinity,
        //     color: Colors.red,
        //     child: Image.asset('assets/logo.png'),
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/home.png'),fit: BoxFit.fill,),
        //
        //     ),
        //
        //   ),
        // ],
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage(),),);
      },backgroundColor: Colors.white70,
      child: Icon(Icons.arrow_forward,),
      ),


    );
  }
}
