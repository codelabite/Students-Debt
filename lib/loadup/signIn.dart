//FirstLogInScreen

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:students/Screens/HomeScreen.dart';
import 'package:students/loadup/RegSreen.dart';


class FirstLogInScreen extends StatefulWidget {
  @override
  _FirstLogInScreenState createState() => _FirstLogInScreenState();
}

class _FirstLogInScreenState extends State<FirstLogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(
                            "asset/images/Ui.jpg"
                        ),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xff4B39CC).withOpacity(.90),
                        image: DecorationImage(image: AssetImage(
                            ""
                        ),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Text("Hello",
                      style: TextStyle(fontSize: 125,color: Colors.white),),
                  ),
                  Positioned(
                    top: 220,
                    left: 28,
                    child: Row(
                      children: <Widget>[
                        Text("Welcome Back",
                          style: TextStyle(fontSize: 40, color: Colors.white),),

                      ],
                    ),
                  ),

                  Positioned(
                      top: 100,
                      left: 20,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            left: 2.5,
                            top: 2.5,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Positioned(
                      top: 240,
                      left: 290,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                      )
                  ),
                  Positioned(
                      top: 340,
                      left: 0,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, ),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: 400,
                          child: Form(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // Text("Hello")
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "email",
                                    labelText: "email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black87,
                                        width: 2,
                                      ),
                                    ),

                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  //keyboardType: TextInputType.emailAddress,
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "password",
                                    labelText: "password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black87,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RaisedButton(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  color: Color(0xFF00D6D9),
                                  textColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                                    child: Text("SignIn",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                  onPressed: ()async{

                                    AuthResult result = await _auth.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text).then((onValue){

                                    }).catchError((onError) => print(onError));
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                      return HomeScreen();
                                    }));
                                    FirebaseUser user = result.user;

                                   /* if(user!=null){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                        return HomeScreen();
                                      }));
                                    }
                                    else{
                                      print("error");
                                    }*/
                                  },
                                ),

                                Row(
                                  children: <Widget>[
                                    Text("Don't have an Account yet,",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white
                                      ),),
                                    FlatButton(
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return FirstRegistrationScreen();
                                        }));
                                      },
                                      child: Text("Click here to SignUp",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white
                                        ),
                                      ),
                                    )


                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
