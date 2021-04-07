import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whynew_new/widget/color.dart';

class CustomerOrderStatus extends StatefulWidget {
  CustomerOrderStatus({Key key}) : super(key: key);

  @override
  _CustomerOrderStatusState createState() => _CustomerOrderStatusState();
}

class _CustomerOrderStatusState extends State<CustomerOrderStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  SizedBox(
                    height: 20,
                  ),
                  Align(alignment:Alignment.topLeft,child: BackButton()),
                  //  CircleAvatar(backgroundColor:Colors.red[400],
                  //  radius: 40,
                  //  child: Center(child: IconButton(icon: Icon(Icons.close_rounded,size:60,color:Colors.black), onPressed: (){Navigator.pop(context,'');}))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  Text(
                                    "Current Status : ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    decoration:
                                        BoxDecoration(color:greyColordark),
                                  )
                                ],
                              ),


                              Container(
                                height: 60, 


                                width: MediaQuery.of(context).size.width*0.60,
                                decoration:BoxDecoration(color:Theme.of(context).primaryColor.withOpacity(0.9),),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton<String>(
                                    isExpanded:true,
                                        value: 'Status',
                                        icon: Icon(Icons.arrow_downward,color: Colors.white,),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Theme.of(context).primaryColor.withOpacity(0.6),
                                        // underline: Container(

                                        // ),
                                        onChanged: (String newValue) {},
                                        items: <String>[
                                          'Shipped',
                                          'Status',
                                          'Delivered',
                                          'Confirmed'
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,style:TextStyle(fontSize: 18,color: Colors.white)),
                                          );
                                        }).toList(),
                                      ),
                                ),
                              ),


                              FlatButton(
                                  height: 46,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.489,
                                  color: Colors.green[600],
                                  child: Text("Update",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                  onPressed: () {}),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )));
  }
}
