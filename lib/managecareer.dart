import 'package:dmythra2/authent.dart';
import 'package:dmythra2/career.dart';
import 'package:dmythra2/orghome.dart';
import 'package:flutter/material.dart';

class ManageCareer extends StatefulWidget {
  const ManageCareer({super.key});

  @override
  State<ManageCareer> createState() => _ManageCareerState();
}

class _ManageCareerState extends State<ManageCareer> {
  BackendServices backendServices = BackendServices();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  String header = 'Career';

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrganizationHome(),),);
              },
              icon: Icon( Icons.home, )),

        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/managecareer.png'),
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
                    backendServices.saveMedia(mediaTitleController.text, header, mediaLinkController.text, header);
                    // if(Career == ''){
                    //   print('select a mode');
                    // }else{
                    //   backendServices.saveMedia(mediaTitleController.text, Career, mediaLinkController.text, Career);
                    // }
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
