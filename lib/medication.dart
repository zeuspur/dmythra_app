import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';
class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
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
                image: AssetImage('assets/medication.png'),
                fit: BoxFit.fill,
              )),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 72.0),
                  child: Text(
                    'Meditation',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                ),
                // Container(
                //   height: 320,
                //   width: double.infinity,
                // ),
                Expanded(
                  child: FutureBuilder(
                      future: backendServices.fetchMedias('Meditation'),
                      builder: (context, snapshot) {
                        return snapshot.connectionState == ConnectionState.waiting
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            : backendServices.mediaList.isEmpty
                            ? Center(
                          child: Text('List is empty'),
                        )
                            : ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                            itemCount: backendServices.mediaList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 240.0),
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
                                      Container(
                                        width: 290,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            color:
                                            Colors.lightBlue.shade50),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 38.0, top: 10),
                                          child: Text(
                                            backendServices.mediaList[index]
                                                .mediaTitle,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      ElevatedButton(onPressed: (){
                                        backendServices.launchYouTubeVideo(backendServices.mediaList[index].mediaLink);
                                      }, child: Text('Click here'))
                                      // InkWell(
                                      //   child: Container(
                                      //     width: 290,
                                      //     height: 50,
                                      //
                                      //     decoration: BoxDecoration(
                                      //         borderRadius:
                                      //             BorderRadius.circular(30),
                                      //         color:
                                      //             Colors.lightBlue.shade50),
                                      //     child: Padding(
                                      //       padding: const EdgeInsets.only(
                                      //           left: 28, top: 5),
                                      //       child: Text(backendServices
                                      //           .mediaList[index].mediaLink),
                                      //     ),
                                      //     // TextField(),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }),
                ),
                SizedBox(
        height: 10,
      ),
    ]
    )),);
  }
}
