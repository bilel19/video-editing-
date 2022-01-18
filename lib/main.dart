import 'package:flutter/material.dart';
import 'package:video_editing_app/screens/main_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Video Editing',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black45,
          ),
          scaffoldBackgroundColor: Colors.black45,
          primarySwatch: Colors.amber,
        ),
        home: MainScreen(),
    );
  }
}
