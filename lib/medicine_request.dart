import 'package:dmythra2/authent.dart';
import 'package:dmythra2/org_acceptedrequest.dart';
import 'package:flutter/material.dart';

class MedicineRequest extends StatefulWidget {
  const MedicineRequest({super.key});

  @override
  State<MedicineRequest> createState() => _MedicineRequestState();
}

class _MedicineRequestState extends State<MedicineRequest> {
  BackendServices backendServices = BackendServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          width: 100,
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
                style: TextStyle(fontSize: 20,color: Colors.white)),
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
                'Medicine Request',
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
                    future: backendServices.fetchMedicines(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : backendServices.medicineList.isEmpty
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
                                  itemCount:
                                      backendServices.medicineList.length,
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
                                                    child: Text(backendServices
                                                        .medicineList[index]
                                                        .phone
                                                        .toString())),
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
                                                        .medicineList[index]
                                                        .description,
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
                                                        onPressed: ()async {
                                                          await   backendServices.deleteRequest( backendServices.medicineList[index].description,  backendServices.medicineList[index].medicineid,).then((value){
                                                            setState(() {

                                                            });});


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
                                                      onPressed: (){},

                                                      // onPressed: ()async {
                                                      //
                                                      //
                                                      //
                                                      // },
                                                      child: Text(
                                                        "Accept",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      style: ButtonStyle(

                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors.grey
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
// List<String >name=[
//   "ajith"
//   "rahul","nithi","ashok","ajmal"
// ];
}
