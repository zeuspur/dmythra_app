import 'package:dmythra2/academic.dart';
import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class ManageAcademic extends StatefulWidget {
  const ManageAcademic({super.key});

  @override
  State<ManageAcademic> createState() => _ManageAcademicState();
}

class _ManageAcademicState extends State<ManageAcademic> {
  BackendServices backendServices = BackendServices();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  String header = 'Academic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Icon(
                Icons.home,
              )),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/manageacademic.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Text(
                  header,
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Container(
                  child: Text(
                    'Title',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: Container(
                  width: 290,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue.shade50),
                  child: TextFormField(
                    controller: mediaTitleController,
                    decoration: InputDecoration(
                      hintText: 'Enter the Title',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Container(
                  child: Text(
                    'Link',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: Container(
                  width: 290,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue.shade50),
                  child: TextFormField(
                    controller: mediaLinkController,
                    decoration: InputDecoration(
                      hintText: 'Enter the Url',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Positioned(
                bottom: 100.0,
                left: 80.0,
                child: InkWell(
                  onTap: () {
                    backendServices.saveMedia(
                      mediaTitleController.text,
                      header,
                      mediaLinkController.text,
                      header,
                        // Navigator.of(context).pop();
                    );
                  },
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 74.0),
                      child: Text(
                        'Post',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // Define your desired decoration here
                      borderRadius: BorderRadius.circular(30.0),
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
