

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';

// import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class ManageOrders extends StatefulWidget {
  
  ManageOrders({Key key}) : super(key: key);

  @override
  _ManageOrdersState createState() => _ManageOrdersState();
}

// ignore: camel_case_types
class _ManageOrdersState extends State<ManageOrders> {
  
  @override
  Widget build(BuildContext context) {
    
    
    
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Manage Orders")),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 20,),
                Center(child: Text("Dealer's Orders",style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))),
                  SizedBox(height: 20,),
                 DealersOrders(), 
                  SizedBox(height: 10,),
                  DealersOrders(), 
                  SizedBox(height: 10,),
                  DealersOrders(), 
                  SizedBox(height: 10,),
                  DealersOrders(), 
                  SizedBox(height: 10,),


              ],)
           
            )
            )
            );
  }
}

class DealersOrders extends StatelessWidget {
  const DealersOrders({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
    color: greyColordark,
    shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //  SizedBox(width: 10,),
        ClipRRect(
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
          child:  Padding(
            padding: const EdgeInsets.only(left:4.0,right:8.0,top:4,bottom:4),
            child: Container(height:80,
         width:80,
 
  decoration: BoxDecoration(border: Border.all(color: Colors.black),
	shape: BoxShape.circle,
	image: DecorationImage(
	  image: NetworkImage("https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png"),
	  fit: BoxFit.fill
	),
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
       "Dealer Name",
       style: TextStyle(fontSize: 16, ),
     )),
              SizedBox(
                height: 10,
              ),
               Align(
     alignment: Alignment.centerLeft,
     child: Text(
       "Orders : ",
       style: TextStyle(fontSize: 12, ),
     )),
              
              

              SizedBox(height: 10,),
              
              
            ],
          ),
          
        ),
        
        Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(icon:Icon(Icons.arrow_forward_ios),
          onPressed:()=>Navigator.pushNamed(context, '/manageCustomersOrders')),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
      );
  }
}
