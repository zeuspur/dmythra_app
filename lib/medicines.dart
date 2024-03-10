import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class Medicines extends StatefulWidget {
  const Medicines({super.key});

  @override
  State<Medicines> createState() => _MedicinesState();
}

class _MedicinesState extends State<Medicines> {
  TextEditingController prescriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  BackendServices backendServices = BackendServices();
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/medicines.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Text(
                  'Medicines',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 190.0),
                child: Container(
                  child: Text(
                    'Prescription',
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
                    onTap: () {
                      backendServices.selectPostPic(context).whenComplete(() {
                        setState(() {
                          prescriptionController.text =
                              backendServices.postPic!.path;
                        });
                      });
                    },
                    controller: prescriptionController,
                    decoration: InputDecoration(
                      // hintText: 'What do you need?',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Positioned(
              //   bottom: 100.0,
              //   left: 80.0,
              //   child: Container(
              //     width: 140.0,
              //     height: 50.0,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 12.0, left: 48.0),
              //       child: Text(
              //         'Upload',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontWeight: FontWeight.w100,
              //             fontSize: 20),
              //       ),
              //     ),
              //     decoration: BoxDecoration(
              //       // Define your desired decoration here
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.blue.shade900,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 230.0),
                child: Container(
                  child: Text(
                    'Phone',
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
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone no',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 190.0),
              //   child: Container(
              //     child: Text(
              //       'Description',
              //       style: TextStyle(fontSize: 20),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 3,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 11.0),
              //   child: Container(
              //     width: 290,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Colors.lightBlue.shade50),
              //     child: TextFormField(
              //       controller: descriptionController,
              //       decoration: InputDecoration(
              //         hintText: 'What do you want?',
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.only(left: 30.0),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 100,
              ),
              Positioned(
                bottom: 100.0,
                left: 80.0,
                child: InkWell(
                  onTap: ()async {
                 await   backendServices.saveMedicine(
                        prescriptionController.text,
                        int.parse(phoneController.text),
                        "Medicine");
                 backendServices.uploadPrescription(backendServices.postPic!, descriptionController.text);
                 Navigator.of(context).pop();
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
