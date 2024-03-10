import 'package:dmythra2/authent.dart';
import 'package:dmythra2/medicine_request.dart';
import 'package:dmythra2/org_acceptedrequest.dart';
import 'package:flutter/material.dart';
class Sponsor_ManageRequest extends StatefulWidget {
  const Sponsor_ManageRequest({super.key});

  @override
  State<Sponsor_ManageRequest> createState() => _Sponsor_ManageRequestState();
}

class _Sponsor_ManageRequestState extends State<Sponsor_ManageRequest> {
  BackendServices backendServices = BackendServices();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineRequest(),
                    ),
                  );
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Colors.blue.shade900)),
                child: Text("Medicine Requests",
                    style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcceptedRequest(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.blue.shade900)),
                  child: Text("Accepted Requests",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
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
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0, left: 20.0),
              child: Text(
                'All Request',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 25.0),
              child: Container(
                height: 560,
                width: 300,
                child: FutureBuilder(
                    future: backendServices.fetchHelps(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : backendServices.requestList.isEmpty
                          ? Center(
                        child: Text('No requests Found'),
                      )
                          : ListView.separated(
                          scrollDirection: Axis.vertical,
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return Container(
                              height: 40,
                              color: Colors.white,
                            );
                          },
                          padding: const EdgeInsets.all(8),
                          itemCount: backendServices.requestList.length,
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
                                                    "assets/sponge.png"),
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
                                          child: Center(
                                              child: Text(
                                                  backendServices
                                                      .requestList[
                                                  index]
                                                  ['helpNumber']
                                                      .toString()))),
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
                                            backendServices
                                                .requestList[index]
                                            ['helpType'],
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            left: 18,
                                            right: 18),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  await backendServices
                                                      .deleteRequest(
                                                    backendServices
                                                        .requestList[
                                                    index]['helpType'],
                                                    backendServices
                                                        .requestList[
                                                    index]['helpid'],
                                                  )
                                                      .then((value) {
                                                    setState(() {});
                                                  });
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white),
                                                ),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.blue
                                                            .shade900))),
                                            Spacer(),
                                            ElevatedButton(
                                              onPressed: () async {
                                                await backendServices
                                                    .acceptRequest(
                                                  backendServices
                                                      .requestList[
                                                  index]['helpType'],
                                                  backendServices
                                                      .requestList[
                                                  index]['helpid'],
                                                )
                                                    .then((value) {
                                                  setState(() {});
                                                });
                                              },
                                              child: Text(
                                                "Accept",
                                                style: TextStyle(
                                                    color:
                                                    Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.blue
                                                          .shade900)),
                                            ),
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
