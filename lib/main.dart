import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students/Screens/HomeScreen.dart';
import 'package:students/loadup/LoadingPage.dart';
import 'package:students/loadup/StartUpPAge.dart';
import 'package:students/loadup/firstPage.dart';

void main(){
  runApp(StudentsRecord());
}

class StudentsRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Student's Record",
      theme: ThemeData(
        fontFamily: 'CaviarDreams',
          primarySwatch: Colors.cyan,
          canvasColor: Colors.cyan[50]
      ),
      debugShowCheckedModeBanner: false,

      home: screenHandling()
      //FirstScreen()
      //HomeScreen(),
    );
  }
}

Widget screenHandling(){
  return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingScreen();
        }
        if(snapshot.hasData){
          return HomeScreen();
        }
        else{
          return FirstScreen1();
        }
      });


}
