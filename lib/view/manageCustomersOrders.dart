import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/color.dart';

// import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class ManageCustomersOrders extends StatefulWidget {
  ManageCustomersOrders({Key key}) : super(key: key);

  @override
  _ManageCustomersOrdersState createState() => _ManageCustomersOrdersState();
}

// ignore: camel_case_types
class _ManageCustomersOrdersState extends State<ManageCustomersOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Customers Orders")),
            body: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  // Center(child: Text("Customers Orders",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  DealersOrders(),
                  SizedBox(
                    height: 10,
                  ),
                  DealersOrders(),
                  SizedBox(
                    height: 10,
                  ),
                  DealersOrders(),
                  SizedBox(
                    height: 10,
                  ),
                  DealersOrders(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ))));
  }
}

class DealersOrders extends StatelessWidget {
  const DealersOrders({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          color: greyColordark,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),

            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(8.0),
            //     bottomRight: Radius.circular(8.0)),
            // side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //  SizedBox(width: 10,),
                ClipRRect(
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 8.0, top: 4, bottom: 4),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " Mr.Sumith Shaha.",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Product Purchased",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                  icon: Icon(Icons.info,
                                      size: 35, color: Colors.blue),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context)
                                            // return StatefulBuilder(builder: (context, setState)
                                            {
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              return new AlertDialog(
                                                title: Column(
                                                  children: [
                                                    Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                      children: [
                                                        new Text(
                                                            'Products Purchased'),
                                                          IconButton(icon: Icon(Icons.close), onPressed: (){Navigator.pop(context, '');},)
                                                      ],
                                                    ),
                                                    SizedBox(height:10),

                                                    Row(mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size:30),
                          SizedBox(width:10),
                          Text("Mr.Sumith Shaha",style: TextStyle(fontSize:25,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600,),),
                        ],
                      ),

                                                  ],
                                                ),
                                                content:
                                                    new SingleChildScrollView(
                          child: Column(
                children: [
                  
                  Center(
                    child: Column(children: [
                      
                      
                      SizedBox(height:10),
                      
                      Container(width:MediaQuery.of(context).size.width*0.90, 
                      height:MediaQuery.of(context).size.height,
                      decoration:BoxDecoration(color:greyColordark),
                        child: Column(
                          children: [
                            SizedBox(height:10),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                
                                Text("Product Name",style: TextStyle(fontSize:20),),
                                Text("Quantity"),
                              ],
                            ),
                            SingleChildScrollView(child:Column(children: [
                              
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              SizedBox(height:10),
                              SingleCustomerProduct(),
                              
                              
                            ],)),
                          ],
                        ),
                      ),
                      
                      


                    ],),
                  ),
                ],
              ),
            )
                                              );
                                            },
                                          );
                                        });
                                  })
                            ],
                          )),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      onTap: () {Navigator.pushNamed(context , '/customerOrderStatus');},
    );
  }
}

class SingleCustomerProduct extends StatelessWidget {
  const SingleCustomerProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:35,
      width:MediaQuery.of(context).size.width*0.80,
      decoration:BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.8),),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
        Text("Lenovo Laptop",style: TextStyle(color: Colors.white,fontSize:15),),
        Text(" 10",style: TextStyle(color: Colors.white,fontSize:15),),
        
      ],),
    );
  }
}