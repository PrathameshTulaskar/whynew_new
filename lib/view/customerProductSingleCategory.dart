import 'package:flutter/material.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/pageLabel.dart';
import 'package:whynew_new/widget/productWidget.dart';

import 'dealersPurchasedList.dart';

class CustomerProductSingleCategory extends StatefulWidget {
  CustomerProductSingleCategory({Key key}) : super(key: key);

  @override
  _CustomerProductSingleCategoryState createState() => _CustomerProductSingleCategoryState();
}

class _CustomerProductSingleCategoryState extends State<CustomerProductSingleCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         
         
      appBar: AppBar(title: Text("Desktop"),),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BackButtonCustom(),
             SizedBox(height: 20),
            Align(alignment:Alignment.center,
              child: Text("Total  Count: 10",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
            CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
             CategoryProducts(),
            SizedBox(height: 10),
          ],
        ),
      ),
    ));
  }
}

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
    color: greyColordark,
    shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(8.0)),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //  SizedBox(width: 10,),
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
          child:  Padding(
            padding: const EdgeInsets.only(left:6.0,right:8.0,top:2,bottom:2),
            child: Container(height:90,
                      width:90,
 
  decoration: BoxDecoration(
    // border: Border.all(color: Colors.black),
	shape: BoxShape.rectangle,
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
          height: 5,
        ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Name :",
                    style: TextStyle(fontSize: 16, ),
                  )),
              SizedBox(
                height: 10,
              ),
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Price: Rs.54545",
                    style: TextStyle(fontSize: 12, ),
                  )),

              
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order date: 12/12/2021",
                    style: TextStyle(fontSize: 12, ),
                  )),
              
               
              
              
            ],
          ),
          
        ),
        
       
      ],
    ),
      ),
        
         
          
        
      ],
    );
  }
}
