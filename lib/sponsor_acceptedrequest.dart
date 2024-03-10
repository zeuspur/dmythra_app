import 'package:dmythra2/authent.dart';
import 'package:dmythra2/orghome.dart';
import 'package:flutter/material.dart';

class AcceptedRequest extends StatefulWidget {
  const AcceptedRequest({super.key});

  @override
  State<AcceptedRequest> createState() => _AcceptedRequestState();
}

class _AcceptedRequestState extends State<AcceptedRequest> {
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrganizationHome(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.home,
                )),
          ],
        ),
        body: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0, left: 20.0),
              child: Text(
                'Accepted request',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 25.0),
              child: Container(
                height: 600,
                width: 300,
                child: FutureBuilder(
                    future: backendServices.fetchAcceptedHelps(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : backendServices.acceptedrequestList.isEmpty
                          ? Center(
                        child: Text('No Requests Accepted'),
                      )
                          : ListView.separated(
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return Container(
                              height: 40,
                              color: Colors.white,
                            );
                          },
                          padding: const EdgeInsets.all(8),
                          itemCount: backendServices.acceptedrequestList.length,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: 280,
                                  width: 354,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade100,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 8.0,
                                                right: 8.0),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/medication.png"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 180.0),
                                        child: Text(
                                          'Phone',
                                          style:
                                          TextStyle(fontSize: 20),
                                          // style: TextStyle(
                                          //      fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                          width: 250,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  30),
                                              color: Colors
                                                  .lightBlue.shade50),
                                          child: Center(child: Text(backendServices.acceptedrequestList[index]["helpNumber"].toString()))
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 170.0),
                                        child: Text(
                                          'Request',
                                          style:
                                          TextStyle(fontSize: 20),
                                          // style: TextStyle(
                                          //      fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Container(
                                        width: 250,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                30),
                                            color: Colors
                                                .lightBlue.shade50),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 78, top: 10),
                                          child: Text(
                                            backendServices.acceptedrequestList[index]["helpType"],
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          left: 90,
                                        ),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Accepted",
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white),
                                                ),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors
                                                            .green))),
                                            Spacer(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    }),
              ),
            )
          ]),
        ));
  }
}
