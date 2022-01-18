import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_editing_app/screens/video_screen.dart';
import 'package:video_editing_app/shared/components/components.dart';
import 'package:video_editing_app/shared/provider/provider.dart';


class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    var picker = ImagePicker();
    File? video;
    return Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.18),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/logo.png'),
              height: 200,
              width: 200,
            ),
            Text(
              'Smart video Editing',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
            ),
            Spacer(),
            Text(
              'Select file to get started',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(
              height: 10,),
            TextButton.icon(
              onPressed: () async {
                final pickedFile = await picker.getVideo(source: ImageSource.gallery);

                if (pickedFile != null) {
                  video = File(pickedFile.path);
                } else {
                  print('No video selected.');
                }
                if(video !=null)
                NavigatTo(context,VideoScreen(video: video));
              },
              icon: Icon(Icons.add_a_photo_sharp),
              label: Text(
                'Select video',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
