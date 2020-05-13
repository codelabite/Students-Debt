import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentsCard extends StatelessWidget {
  StudentsCard({this.name, this.time, this.totalDebt, this.presentDebt, this.point, this.image});
  final name;
  final totalDebt;
  final presentDebt;
  final point;
  final image;
  final time;


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
           // padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(image: NetworkImage(image),
                    fit: BoxFit.cover)
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    /*Text(
                        DateFormat.yMMMd()
                        .add_jm().format
                        (DateTime.parse(time))
                    ),*/

                    Text(
                        DateFormat.yMMMd().add_jm()
                            .format(DateTime.now()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan
                      ),
                    ),

                    Text(name,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Your points EARN: ",
                          style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold
                          ),),

                        Text("${point}%",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[

                        Text("Your present Debt: ",
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold
                          ),),

                        Text(presentDebt,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("Total Debt: ",
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold
                          ),),
                        Text(totalDebt,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            color: Colors.red
                          ),),
                        Text(" Naira Only",
                          style: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),

              ],
            ))


    );
  }
}



/*
CustomCard(
title: document['title'],
description: document['description'],
);
}).toList()*/



