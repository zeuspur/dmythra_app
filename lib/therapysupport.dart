import 'package:dmythra2/counselling.dart';
import 'package:dmythra2/medication.dart';
import 'package:dmythra2/physiotherapy.dart';
import 'package:dmythra2/yoga.dart';
import 'package:flutter/material.dart';
class TherapySupport extends StatefulWidget {
  const TherapySupport({super.key});

  @override
  State<TherapySupport> createState() => _TherapySupportState();
}

class _TherapySupportState extends State<TherapySupport> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),

      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/therapy support.png'),
              fit: BoxFit.fill,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Counselling(),),);
              },
              child: Container(
                alignment:Alignment.center,
                height: 50,
                width: 300,
                child: Text(
                  'Counselling',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 30,
            ),
            InkWell(
              onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PhysioTherapy(),),);

              },
              child: Container(
                alignment:Alignment.center,
                height: 50,
                width: 300,
                child: Text(
                  'Physio Therapy',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Medication(),),);
              },
              child: Container(
                alignment:Alignment.center,
                height: 50,
                width: 300,
                child: Text(
                  'Meditation',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Yoga(),),);
              },
              child: Container(
                alignment:Alignment.center,
                height: 50,
                width: 300,
                child: Text(
                  'Yoga',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
