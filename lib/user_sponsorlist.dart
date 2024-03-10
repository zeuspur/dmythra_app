import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class User_SponsorList extends StatefulWidget {
  const User_SponsorList({super.key});

  @override
  State<User_SponsorList> createState() => _User_SponsorListState();
}

class _User_SponsorListState extends State<User_SponsorList> {
  BackendServices backendServices = BackendServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
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
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/organizationlist.png"),
                  fit: BoxFit.fill)),
          child: Center(
            child: Container(

              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 75.0, left: 20.0),
                  child: Text(
                    'Sponsor ',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, left: 3.0),
                  child: Container(
                    height: 300,
                    width: 320,
                    child: FutureBuilder(
                        future: backendServices.fetchSponsor(),
                        builder: (context, snapshot) {
                          return snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : backendServices.sponsorsList.isEmpty
                                  ? Center(
                                      child: Text('No Sponsors found'),
                                    )
                                  : ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Container(

                                          width: 40,
                                          height: 220,
                                          color: Colors.transparent,
                                        );
                                      },
                                      padding: const EdgeInsets.all(8),
                                      itemCount: backendServices.sponsorsList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Container(
                                              height: 240,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.start,
                                                    children: [
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets
                                                      //               .only(
                                                      //           top: 8.0,
                                                      //           left: 18.0),
                                                      //   child: Container(
                                                      //     width: 50,
                                                      //     height: 50,
                                                      //     child: CircleAvatar(
                                                      //       backgroundImage:
                                                      //           AssetImage(
                                                      //               "assets/Ellipse 10.png"),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8,
                                                                  top: 14),
                                                          child: Text(
                                                              'Name:${backendServices.sponsorsList[index].sponsorname }',                                                            style: TextStyle(
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(right: 110,
                                                             top: 10),
                                                    child: Text(
                                                      'Ph:${backendServices.sponsorsList[index].phone }',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Email:${backendServices.sponsorsList[index].email }',
                                                    style: TextStyle(
                                                        fontSize: 20),
                                                    // style: TextStyle(
                                                    //      fontSize: 20),
                                                  ),
                                                  // Padding(
                                                  //   padding: EdgeInsets.only(
                                                  //     top: 10,
                                                  //     left: 110,
                                                  //   ),
                                                  Spacer(),
                                                     ElevatedButton(
                                                      onPressed: () {
                                                    backendServices.callingFunction(backendServices.sponsorsList[index].phone.toString());
                                                      },
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors
                                                                      .green)),
                                                      child: Icon(
                                                        Icons.call,
                                                        color: Colors
                                                            .black,
                                                      ),
                                                    ),

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
            ),
          )),
    );
  }
}
