import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  TextEditingController helptypeController = TextEditingController();
  TextEditingController helpNumberController = TextEditingController();
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
          image: AssetImage('assets/food.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Text(
                  'Food',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 220.0),
              //   child: Container(
              //     child: Text(
              //       'Ask me...',
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
              //       controller: helptypeController,
              //       decoration: InputDecoration(
              //         hintText: 'What do you need?',
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.only(left: 30.0),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
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
                    controller: helpNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone no',
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
                    backendServices.saveHelp(
                        'Food Help',
                        "Food",
                        int.parse(helpNumberController.text)).then((value) => Navigator.of(context).pop());
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
