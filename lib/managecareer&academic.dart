import 'package:dmythra2/academic.dart';
import 'package:dmythra2/manageacademic.dart';
import 'package:dmythra2/managecareer.dart';
import 'package:flutter/material.dart';
class ManageCareerandacademic extends StatefulWidget {
  const ManageCareerandacademic({super.key});

  @override
  State<ManageCareerandacademic> createState() => _ManageCareerandacademicState();
}

class _ManageCareerandacademicState extends State<ManageCareerandacademic> {
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
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon( Icons.home, )),

        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/manageacademic&career.png'),
              fit: BoxFit.fill,
            )),
        child: Column(
          children: [
            SizedBox(height: 250,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageCareer(),),);
                },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Text(
                          'Career',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 100,),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageAcademic(),),);
                },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Academic',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
