
import 'dart:async';
import 'package:flare_dart/actor.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students/Screens/HomeScreen.dart';
import 'package:students/loadup/RegSreen.dart';
import 'package:students/loadup/signIn.dart';

class FirstScreen1 extends StatefulWidget {
  @override
  _FirstScreen1State createState() => _FirstScreen1State();
}

class _FirstScreen1State extends State<FirstScreen1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              color: Color(0xff4B39CC).withOpacity(.90),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 200,
                  width: 200,
                  /*decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(
                          "asset/images/Glogo.png"
                      ), fit: BoxFit.cover)
                  ),*/
                  child: FlareActor("asset/images/Loading.flr",
                    fit: BoxFit.cover,
                    animation: "Alarm",),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Welcome to",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff00D6D9),
                          fontWeight: FontWeight.bold
                      ),),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(" Class Record",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff00D6D9),
                              fontWeight: FontWeight.bold
                          ),),
                        Container(
                          height: 2,
                          width: 70,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                Column(

                  children: <Widget>[
                    Text("Checking your Points and Debts",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(
                      height: 5,
                    ),
                    Text("in Real Time, without delay!",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      FlatButton(
                          color: Color(0xFF00D6D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return FirstRegistrationScreen();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text("Let's Get Started",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        //color: Color(0xFF00D6D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: 2,
                                color: Color(0xFF00D6D9),
                              )
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return FirstLogInScreen();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text("Log In",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                          )),
                      SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                )


                /* Container(
                    height: 400,
                    width: 400,
                    child: Form(

                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Email",
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 5,
                                  color: Color(0xff00D6D9)
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )*/
              ],
            ),

            Positioned(
              top: 630,
              left: 130,
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
