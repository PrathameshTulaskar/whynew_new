import 'package:flutter/material.dart';
import 'package:whynew_new/model/filter.dart';
import 'package:whynew_new/model/searchBar.dart';
import 'package:whynew_new/view/profile.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/profileTile.dart';

// ignore: camel_case_types
class CustomerProductHistory extends StatefulWidget {
  CustomerProductHistory({Key key}) : super(key: key);

  @override
  _CustomerProductHistoryState createState() => _CustomerProductHistoryState();
}

// ignore: camel_case_types
class _CustomerProductHistoryState extends State<CustomerProductHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Customer product List")),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomerDetails(),
                 
                    SizedBox(height: 20),
                    
                    SizedBox(height: 15),
                   
                  ],
                ),
              ),
            )));
  }
}

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Icon(Icons.person,color: Theme.of(context).primaryColor,size: 70,),
            ),
            ),
            Text("Divesh Naik",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color:Theme.of(context).primaryColor)),
          ],
        ),
       
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
        decoration: BoxDecoration(
            color: greyColordark,
        ),
        child: Column(
            children: [
              Align(alignment: Alignment.centerRight,child: IconButton(icon: Icon(Icons.edit), onPressed: (){print("object");})),
              // SizedBox(height:5),
              ProfileSubDetail(
                icon: Icons.call,
                label: "Mobile Number:",
                value: "+91 7038544429",
              ),
              ProfileSubDetail(
                icon: Icons.email,
                label: "Email:",
                value: "info@weblozee.com",
              ),
              ProfileSubDetail(
                icon: Icons.date_range,
                label: "DOB:",
                value: "25th Jan 1998",
              ),
              
               ProfileSubDetail(
                icon: Icons.location_city,
                label: "Current Address:",
                value: "House No.7",
              ),
              SizedBox(height:15),
            ],
        ),
      ),
         ),
         SizedBox(height: 10,),
         Column( mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ProfileListTile(
              iconPathSvg: "assets/svg/computer.svg",
              title: "Desktop",
              onClick: () => Navigator.pushNamed(context, '/customerProductSingleCategory'),
            ),
             ProfileListTile(
              iconPathSvg: "assets/svg/laptop.svg",
              title: "Laptop",
              onClick: () => Navigator.pushNamed(context, ''),
            ),
             ProfileListTile(
              iconPathSvg: "assets/svg/headphones.svg",
              title: "Headphones",
              onClick: () => Navigator.pushNamed(context, ''),
            ),
          ],)
      ],
    );
  }
}