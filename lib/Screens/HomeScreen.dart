import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:students/Screens/CustonCard.dart';
import 'package:students/Screens/studentsCard.dart';
import 'package:students/loadup/firstPage.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;

  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    super.initState();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: ()async{
                await _auth.signOut().then((onValue){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return FirstScreen1();
                  }));
                }).catchError((onError)=>print(onError));
              },
              icon: Icon(Icons.person_outline, color: Colors.white,),
              label: Text("Log Out",
              style: TextStyle(
                color: Colors.white
              ),))
        ],
        centerTitle: false,
        title: Text(
          "Student's Record",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('results').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return Column(
                    children: <Widget>[
                      StudentsCard(
                        time: document['time'],
                        image: document['image'],
                        name: document['name'],
                        point: document['point'],
                        presentDebt: document['presentDebt'],
                        totalDebt: document['totalDebt'],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
