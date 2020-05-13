import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students/loadup/firstPage.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 6),
            (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return FirstScreen1();
          }));
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Color(0xff4B39CC),

                image: DecorationImage(image: AssetImage(
                    "asset/images/Ui.jpg"
                ), fit: BoxFit.cover),
              ),
            ),
            Container(
              color: Color(0xff4B39CC).withOpacity(.90),
            ),
            Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(
                            "asset/images/Glogo.png"
                        ), fit: BoxFit.cover)
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              top: 630,
              left: 140,
              child: Text("Class Record",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff00D6D9),
                    fontWeight: FontWeight.bold
                ),),
            )
          ],
        ),
      ),
    );
  }
}
