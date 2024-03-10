
import 'package:dmythra2/authent.dart';
import 'package:dmythra2/sponsor_managerequest.dart';
import 'package:dmythra2/sponsor_payment.dart';
import 'package:dmythra2/sponsor_viewactivities.dart';
import 'package:flutter/material.dart';
import 'package:dmythra2/sponsor_profile.dart';

class SponsorHome extends StatefulWidget {
  const SponsorHome({super.key});

  @override
  State<SponsorHome> createState() => _SponsorHomeState();
}

class _SponsorHomeState extends State<SponsorHome> {
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
                  builder: (context) => SponsorProfile(),
                ),
              );
              // Handle profile icon tap action here
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/sponsorhome.png'),
              fit: BoxFit.fill,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sponsor_ManageRequest(),),);
                },
                  child: Container(
                    height: 110,
                    width: 160,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          'Manage Request',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: () {
                    backendServices.callingFunction("${8606687216}");
                  },
                  child: Container(
                    height: 110,
                    width: 160,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          '      Call Organization',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sponsor_ViewActivity(),),);
                },
                  child: Container(
                    height: 110,
                    width: 160,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 29.0),
                        child: Text(
                          '   View Activities',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 50,
            // ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SponsorPayment(),),);
                },
                  child: Container(
                    height: 110,
                    width: 160,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          'Donate',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
