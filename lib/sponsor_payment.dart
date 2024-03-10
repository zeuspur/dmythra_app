import 'package:dmythra2/sponserhome.dart';
import 'package:dmythra2/sponsor_managerequest.dart';
import 'package:flutter/material.dart';
class SponsorPayment extends StatefulWidget {
  const SponsorPayment({super.key});

  @override
  State<SponsorPayment> createState() => _SponsorPaymentState();
}

class _SponsorPaymentState extends State<SponsorPayment> {
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
      ),
      body: Container(
      width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/paymnt.png'),
    fit: BoxFit.fill,
    )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: 45,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SponsorHome(),),);
              },
              child: Container(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/gpay.jpg"),
                ),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SponsorHome(),),);
              },
              child: Container(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/phnp.png"),
                ),
              ),
                  ),


          ],
        ),

      ]),
    ),
    );
  }
}
