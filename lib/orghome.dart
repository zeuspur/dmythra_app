import 'package:dmythra2/org_userlist.dart';
import 'package:dmythra2/org_viewactivity.dart';
import 'package:dmythra2/managecareer&academic.dart';
import 'package:dmythra2/managetherapy.dart';
import 'package:dmythra2/organization_sponserlist.dart';
import 'package:dmythra2/orgviewrequest.dart';
import 'package:flutter/material.dart';

class OrganizationHome extends StatefulWidget {
  const OrganizationHome({super.key});

  @override
  State<OrganizationHome> createState() => _OrganizationHomeState();
}

class _OrganizationHomeState extends State<OrganizationHome> {
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
          image: AssetImage('assets/Organizationhome.png'),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Organization_UserList(),),);
                },
                  child: Container(
                    height: 100,
                    width: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          'User List',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Organization_SponserList(),),);
                },
                  child: Container(
                    height: 100,
                    width: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          'Sponsor List',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Organization_ViewActivities(),),);
                },
                  child: Container(
                    height: 100,
                    width: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'View Activities',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewRequest(),
                    ),
                  );
                },
                  child: Container(
                    height: 100,
                    width: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'View Request',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageTherapy(),),);
                },
                  child: Container(
                    height: 100,
                    width: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 42.0),
                        child: Text(
                          'Manage Therapy',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageCareerandacademic(),),);
                },
                  child: Container(
                    height: 100,
                    width: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '      Manage Academic&Career',
                          style: TextStyle(color: Colors.white, fontSize: 16),
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
            SizedBox(
              height: 50,
            ),
            InkWell(onTap: () {

            },
              child: Container(
                height: 100,
                width: 150,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      'Messages',
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
      ),
    );
  }
}
