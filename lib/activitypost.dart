import 'package:dmythra2/authent.dart';
import 'package:flutter/material.dart';

class ActivityPost extends StatefulWidget {
  const ActivityPost({super.key});

  @override
  State<ActivityPost> createState() => _ActivityPostState();
}

class _ActivityPostState extends State<ActivityPost> {
  BackendServices backendServices = BackendServices();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    backendServices.fetchUserData();
    super.initState();
  }

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Text('Activity', style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 35.0),
                child: Text(
                  'Feed',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await backendServices.selectPostPic(context);
                setState(() {});
              },
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: backendServices.postPic == null
                        ? AssetImage('assets/add.png')
                        : FileImage(backendServices.postPic!) as ImageProvider,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 18.0),
                child: Text(
                  'Bio',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              width: 300.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.lightBlue.shade50,
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: TextFormField(
                controller: bioController,
                decoration: InputDecoration(
                  hintText: 'Enter your bio',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 30.0),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () async {
                // await backendServices.fetchUserData();
                await backendServices.savePost(backendServices.postPic!.path,
                    bioController.text, backendServices.userModel.username);

                backendServices.uploadPostPhoto(
                    backendServices.postPic!, bioController.text);
                Navigator.of(context).pop();
              },
              child: Container(
                width: 200.0,
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 54.0),
                  child: Text(
                    'Add Post',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
