import 'package:flutter/material.dart';
class User_AboutOrganization extends StatefulWidget {
  const User_AboutOrganization({super.key});

  @override
  State<User_AboutOrganization> createState() => _User_AboutOrganizationState();
}

class _User_AboutOrganizationState extends State<User_AboutOrganization> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body:
      Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/aboutus.png'),
        //
        //     )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Text('About Us',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Image.asset('assets/aboutus.png'),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('Dmythra is a compassionate organizati\non committed to providing invaluable support and education for individuals with disabilities. Our mission is rooted \nin the belief that every person, regardless of their abilities, deserves \nthe opportunity to lead a fulfilling and empowered life. Through a variety of programs and initiatives, Dmythra strives to break down barriers and create a more inclusive and supportive environment for the disabled community.',style: TextStyle(fontSize: 18),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('Vision:\nDmythra envisions a world where \nindividuals with disabilities are not\n defined by limitations but celebrated\n for their unique strengths. Through \nour commitment to education and \nsupport, we aspire to create a society \nthat values diversity and ensures equal opportunities for all, regardless of ability.',style: TextStyle(fontSize: 18),),
              ),
            ],
            

          ),
        ),
      ),
    );
  }
}
