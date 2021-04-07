import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';


// ignore: camel_case_types
class ByProductDetails extends StatefulWidget {
  ByProductDetails({Key key}) : super(key: key);

  @override
  _ByProductDetailsState createState() => _ByProductDetailsState();
}

// ignore: camel_case_types
class _ByProductDetailsState extends State<ByProductDetails> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
  return SafeArea(
        child: Scaffold(
          appBar:AppBar(title:Text("Product Details")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: 
            //[
              List<Widget>.generate(appState.soldProduct.length,(index)
                {
                   
                   DateFormat formatter = DateFormat('yyyy-MM-dd');
                   String formatted = formatter.format(appState.soldProduct[index].productPurchasedOn.toDate());
                      print("$formatted date time example");
          
                  return  ApproveProductRequest(
                      customerName: appState.soldProduct[index].customerName,
                      customerImgUrl: appState.soldProduct[index].customerImgUrl,
                      price: appState.soldProduct[index].price,
                      contactNumber: appState.soldProduct[index].contactNumber,
                      currentAddress: appState.soldProduct[index].customerAddress,
                      productPurchasedOn:formatted
                  );

                }   ),
              
              
              
             // ApproveProductRequest(),
              //ApproveProductRequest(),
           // ],
        ),
      ),
    ))
    );
  }
}

class ApproveProductRequest extends StatelessWidget {
  final String customerImgUrl;
  final String  price;
  final String contactNumber;
  final String customerName;
  final String currentAddress;
  
  final String productPurchasedOn;
  const ApproveProductRequest({
    this.contactNumber,
    this.customerImgUrl,
    this.price,
    this.customerName,
    this.currentAddress,
    this.productPurchasedOn,
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
            topLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0)),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
    child: Row(mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
           Image.network(this.customerImgUrl ??
                    "",
                    height: 100,
                    width: MediaQuery.of(context).size.width*0.25,
                    fit: BoxFit.cover,

                  ),
              
        ]
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(this.customerName ?? ""),
                       Text("Price: ${this.price}/-"),
                        Text("Purchased On:${this.productPurchasedOn}"),
     
                        Text("Contact No.:${this.contactNumber}"),
                        Text("Address:${this.currentAddress}"),
                    ],
                  )
       
      ]
    ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     //  SizedBox(width: 10,),
    //     ClipRRect(
    //       borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: greyColordark,
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.all(5.0),
    //           child: Row(mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Image.network(
    //                 "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
    //                 height: 50,
    //                 width: 50,
    //                 fit: BoxFit.cover,

    //               ),
    //               SizedBox(width:20),
    //                Column(mainAxisAlignment: MainAxisAlignment.start,
    //                  children: [
    //                    Text("Product Name: Lenovo Desktop"),
    //                    Text("Price: 4200000"),
    //                  ],
    //                ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
        
    //     Text("Purchased On:"),
    //     Text("Customer Name:"),
    //     Text("Nobile No.:"),
    //     Text("Address:"),
          

        
        
    //     // Icon(Icons.arrow_forward_ios),
       
    //   ],
    // ),
      ),
        
         
          
        
      ],
    );
  }
}
