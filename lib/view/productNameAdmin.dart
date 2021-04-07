

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';

// import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class ProductNameAdmin extends StatefulWidget {
  
  ProductNameAdmin({Key key}) : super(key: key);

  @override
  _ProductNameAdminState createState() => _ProductNameAdminState();
}

// ignore: camel_case_types
class _ProductNameAdminState extends State<ProductNameAdmin> {
  
  @override
  Widget build(BuildContext context) {
    
    
    
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Product Name")),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        SizedBox(width: 20),
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.network(
                            "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    SizedBox(height: 50),
                   
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) 
                              ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 20),
                                    Text("Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24)),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.55),
                                    IconButton(
                                        icon: Icon(Icons.post_add_rounded),
                                        onPressed: null)
                                  ],
                                ),
                                Text("fttydfchgvjhtyufvvhjbjbh"),
                                SizedBox(height: 85,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("See More",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24)),
                                    ])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                      FlatButton(
                    color:Colors.red, child:Text("Reject",style: TextStyle(fontSize: 12,color:Colors.white)),
                    onPressed:(){  showDialog(
           
                  context: context,
                  builder: (BuildContext context)
                  // return StatefulBuilder(builder: (context, setState)
                   {
                     
                     return StatefulBuilder(builder: (context, setState){
                        return new AlertDialog(

              title: new Text('Reject Note'),
              
              content: new SingleChildScrollView(
              child:Column(
                children: [
                  Container(height:100,
                  width:MediaQuery.of(context).size.width*0.80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child:TextFormField(),
                                 
                            ),
                            SizedBox(height:15),
                            
                 FlatButton(
                    color:Colors.red, child:Text("Submit",style: TextStyle(fontSize: 12,color:Colors.white)),
                    onPressed:(){
                        

                    }),
                ],
              ),
                    ),


              );
                     },);
           
           
                  
                 
                 
                 
               
                }
      );}),
                FlatButton(
                    color:Colors.green, child:Text("Approve",style: TextStyle(fontSize: 12,color:Colors.white)),
                    onPressed:(){setState(() {
                      final appState = Provider.of<Appstate>(context);
                      appState.isApprove=true;
                    });
                    Navigator.pop(context);
                    
                    }),
                    ],),
                  ],
                ),
              ),
            )));
  }
}
