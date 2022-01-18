import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_editing_app/screens/video_editor_screen.dart';
import 'package:video_editing_app/shared/components/components.dart';
import 'package:video_editing_app/widget/controls_overlay.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {

  File? video;
  VideoScreen({this.video});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _videoPlayerController;

  @override
  initState() {
    super.initState();
    print(widget.video!);
    _videoPlayerController =VideoPlayerController.file(widget.video!)
      ..initialize().then((value){
        setState(() {
          _videoPlayerController!.play();
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton.icon(
                onPressed: (){
                  NavigatAndFinish(context,VideoEditor(file:widget.video!));
                },
                label: Text('Edit',style:TextStyle(color: Colors.white,),),
                icon: Icon(Icons.edit,size: 15,color: Colors.white,),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(widget.video !=null)
              _videoPlayerController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:
                          _videoPlayerController!.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(_videoPlayerController!),
                          ControlsOverlay(controller: _videoPlayerController!),
                          VideoProgressIndicator(_videoPlayerController!, allowScrubbing: true),
                        ],
                      ),
                    )
                  : Container(),
              if(widget.video ==null)
              Column(
                children: [
                  Text(
                    "Click on Pick Video to select video",
                    style: TextStyle(fontSize: 18.0,color: Colors.white),
                  ),
                  TextButton.icon(
                    onPressed: () {
                     },
                    icon: Icon(Icons.add_a_photo_rounded),
                    label: Text("Pick Video"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

