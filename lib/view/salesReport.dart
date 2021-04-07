import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/pageLabel.dart';

class SalesReport extends StatefulWidget {
  SalesReport({Key key}) : super(key: key);

  @override
  _SalesReportState createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonCustom(),
              PageLabel(label: "Sale Report"),
              Container(
                width: MediaQuery.of(context).size.width,
                
                margin: EdgeInsets.only(left: 10, right: 10),
                child: DottedBorder(
                  radius: Radius.circular(12),
                  color: Colors.black,
                  strokeWidth: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Sale"),
                          Text("Rs.52,00,000"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Product Sold"),
                          Text("3500"),
                        ],
                      ),
                      
                        
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
