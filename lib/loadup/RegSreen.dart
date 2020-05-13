import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:students/Screens/HomeScreen.dart';
import 'package:students/loadup/signIn.dart';


class FirstRegistrationScreen extends StatefulWidget {
  @override
  _FirstRegistrationScreenState createState() => _FirstRegistrationScreenState();
}

class _FirstRegistrationScreenState extends State<FirstRegistrationScreen> {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

 /* @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }*/


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
                        color: Color(0xFF4B38CC).withOpacity(.90),
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
                      style: TextStyle(fontSize: 125, color: Colors.white),),
                  ),
                  Positioned(
                    top: 220,
                    left: 28,
                    child: Row(
                      children: <Widget>[
                        Text("Create your Account",
                          style: TextStyle(fontSize: 28, color: Colors.white),),

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
                      left: 300,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00D6D9)
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
                                    child: Text("Register Now",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                  onPressed: ()async{

                                  AuthResult result = await _auth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text).then((onValue){

                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                      return HomeScreen();
                                    }));

                                  }).catchError((onError) => print(onError));

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
                                    Text("Already have an Account?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white
                                      ),),
                                    FlatButton(
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return FirstLogInScreen();
                                        }));
                                      },
                                      child: Text("Click here to SignIn",
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
