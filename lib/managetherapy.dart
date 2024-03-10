import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class ManageTherapy extends StatefulWidget {
  const ManageTherapy({super.key});

  @override
  State<ManageTherapy> createState() => _ManageTherapyState();
}

class _ManageTherapyState extends State<ManageTherapy> {
  String selectedMode = '';
  BackendServices backendServices = BackendServices();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
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
          image: AssetImage('assets/managetherapy.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Text(
                  'Therapy',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
              ),
              // Container(
              //   color: Colors.grey,
              //   height: 150,
              //   width: double.infinity,
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Container(
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              RadioListTile(title: Text('Counselling'),
                activeColor: Colors.black,
                value: 'Counselling',
                groupValue: selectedMode,
                onChanged: (value) {
                  setState(() {
                    selectedMode = value!;
                  });
                },
              ),
              RadioListTile(title: Text('Physiotherapy'),
                activeColor: Colors.black,
                value: 'Physiotherapy',
                groupValue: selectedMode,
                onChanged: (value) {
                  setState(() {
                    selectedMode = value!;
                  });
                },
              ),
              RadioListTile(title: Text('Meditation'),
                activeColor: Colors.black,
                value: 'Meditation',
                groupValue: selectedMode,
                onChanged: (value) {
                  setState(() {
                    selectedMode = value!;
                  });
                },
              ),
              RadioListTile(title: Text('Yoga'),
                activeColor: Colors.black,
                value: 'Yoga',
                groupValue: selectedMode,
                onChanged: (value) {
                  setState(() {
                    selectedMode = value!;
                  });
                },
              ),


              // SizedBox(height: 3,),
              // Padding(
              //   padding: const EdgeInsets.only(right: 11.0),
              //   child: Container(
              //     width: 290,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30),
              //         color: Colors.lightBlue.shade50),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         hintText: 'Enter the Category',
              //         border: InputBorder.none,
              //         contentPadding:
              //         EdgeInsets.only(left: 30.0),
              //       ),
              //     ),
              //   ),
              // ),
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
                      color: Colors.lightBlue.shade100),
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
                      color: Colors.lightBlue.shade100),
                  child: TextFormField(
                    controller: mediaLinkController,
                    decoration:
                    InputDecoration(
                      hintText: 'Enter the Url',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Positioned(
                bottom: 100.0,
                left: 80.0,
                child: InkWell(
                  onTap: () {
                    if(selectedMode == ''){
                      print('select a mode');
                    }else{
                      backendServices.saveMedia(mediaTitleController.text, selectedMode, mediaLinkController.text, selectedMode);
                    }
                   
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
