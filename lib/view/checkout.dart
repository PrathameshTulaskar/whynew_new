import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/checkoutAddressTimingInfo.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/model/order.dart';
import 'package:whynew_new/model/product.dart';
// import 'package:whynew_new/model/order.dart';
// import 'package:whynew_new/model/product.dart';
// import 'package:whynew_new/model/productOrderDetails.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/arrowIconButton.dart';
import 'package:whynew_new/widget/backButton.dart';

class CheckoutPage extends StatefulWidget {
  final Credentials userData;
  CheckoutPage({Key key,this.userData}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String test;
  

  @override
  Widget build(BuildContext context) {
     Order args = ModalRoute.of(context).settings.arguments;
      // var orderDetails =args.
     final appState = Provider.of<Appstate>(context);
    test = "test";
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Color(int.parse("0xff009E0F"))),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWithIcon(routeName: "/home:",title: 'Cancel Order',isHalfPage: false,iconVisible: false,),
              ButtonWithIcon(title: 'Place Order',isHalfPage: false,iconVisible: true,
              onPressed:()async{
                        // print("user Id is ${widget.userData.userId}");
                        //  print("arguments in checkout page  ${args.orderItems[0].productId} ,orderObject productId ${args.orderItems[0].productName}");
                        // print("arguments in checkout page ${args.productName} and useId is ${appState.userId}");
                      
                      var response = await appState.addOrder( Order(orderItems:appState.cartDetail.map((e)=>OrderItems(productImg: e.imgUrl,productId:e.productId,productName: e.productName,productQty: e.productQty.toString(),
           productTotal: "200")).toList(),));
                       print("arguments in checkout page  after ${args.orderItems[0].productId} ,orderObject productId ${args.orderItems[0].productName}");
                      // var response = await appState.addOrder(Order(productName:args.orderItems[0].productName,));
                      print(" response of add ordr $response");
                      if(response==null){
                              final error =  SnackBar(
                                  content: Text(
                                  'Something went wrong... try again.'),
                                  backgroundColor: Colors.red,
                                );
                                   Scaffold.of(context).showSnackBar(error);
                      }
                      else{
                         Navigator.pushNamed(context,'/productAddConfirmation',
                         arguments: response);
                        }
                     
                   
                      }
                      


              //  if(args.orderItem!=0){
              //     Navigator.pushNamed(context,'/productAddConfirmation')
              //   }else{
              //     print("out Of Stock")
              //   },
            
             
              ), 
            ],
          ),
        ),
      ),
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonCustom(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Checkout",
                          style: Theme.of(context).textTheme.headline4),
                      SvgPicture.asset(
                        "assets/svg/shopping-cart.svg",
                        width: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                //   ExpandableInfoBox(
                //     selectedInfo: 'Home',
                //     title: 'Delivery Address: ',
                //     addressTimingList: 
                //     List<CheckoutAddressTiming>.generate(appState.addressDetails ==null ?0 :appState.addressDetails.length,(index)
                  
                // {
                //   var area = appState.addressDetails[index].area;
                //   var landMark=appState.addressDetails[index].landMark;
                //   var pinCode=appState.addressDetails[index].pincode;
                //   print("${appState.addressDetails[index].area} area of customers");
                //   return   CheckoutAddressTiming(
                //           info:
                //               "Area: $area, LandMark: $landMark, Pincode: $pinCode",
                //           isSelected: true);

                // }   ),
                     

                //       // CheckoutAddressTiming(
                //       //     info:
                //       //         "H.no 123, address city1, Landmark line, City-State pin - 123-456",
                //       //     isSelected: true),
                //       // CheckoutAddressTiming(
                //       //     info:
                //       //         "H.no 123, address city1, Landmark line, City-State pin - 123-456",
                //       //     isSelected: false)
                   
                //   ),
                  SizedBox(
                    height: 30,
                  ),
                  ExpandableInfoBox(
                    selectedInfo: '12:00 pm - 1:30 pm',
                    title: 'Delivery Time: ',
                    addressTimingList: [
                      CheckoutAddressTiming(
                          info: "12:00 pm - 1:30 pm", isSelected: true),
                      CheckoutAddressTiming(
                          info: "2:00 pm - 5:30 pm", isSelected: false)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // BillingDetails(),
                  BillingDetails(boldTitle: false,isPercentage: false,price: "5000",title: "Subtotal",),
                  BillingDetails(boldTitle: false,isPercentage: true,price: "10%",title: "Discount",),
                  BillingDetails(boldTitle: false,isPercentage: true,price: "18%",title: "GST",),
                  BillingDetails(boldTitle: true,isPercentage: false,price: "4500",title: "Total",),
                 SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class BillingDetails extends StatelessWidget {
  final bool boldTitle ;
  final bool isPercentage;
  final String title;
  final String price;
  const BillingDetails({
    this.boldTitle,this.isPercentage,this.price,this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        
        children: [
          Container(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.title,style: TextStyle(fontWeight: this.boldTitle ? FontWeight.bold : FontWeight.normal),
              ),
              Row(children: [
                  this.isPercentage ? Container() : Text("Rs. "),
              Text(this.price),
              this.isPercentage ? Container() : Text("/-")
              ],)
            
            ],
          ),
          Divider(
            color: Colors.grey[800],
          )
        ],
      ),
    );
  }
}

class ExpandableInfoBox extends StatelessWidget {
  final String title;
  final String selectedInfo;
  final List<CheckoutAddressTiming> addressTimingList;

  const ExpandableInfoBox(
      {Key key, this.addressTimingList, this.selectedInfo, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: ExpandablePanel(
          header: Row(
            children: [
              SvgPicture.asset(
                "assets/svg/shopping-bag.svg",
                width: 35,
              ),
              SizedBox(
                width: 25,
              ),
              Row(
                children: [
                  Text(
                    this.title,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 12,
                        ),
                  ),
                  Text(this.selectedInfo,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                ],
              )
            ],
          ),
          collapsed: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 5,
              ),
              AddressTimingSelection(
                info: addressTimingList[0].info,
                selected: addressTimingList[0].isSelected,
              ),
              AddressTimingSelection(
                info: addressTimingList[1].info,
                selected: addressTimingList[1].isSelected,
              ),
            ],
          ),
          // expanded: Text("article.body", softWrap: true, ),
        ),
      ),
    );
  }
}

class AddressTimingSelection extends StatelessWidget {
  final String info;
  final bool selected;
  const AddressTimingSelection({
    this.info,
    this.selected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        // dense: true,
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(100),
              color: this.selected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).canvasColor),
          width: 10,
          height: 10,
        ),
        title: Text(
          this.info,
        ),
      ),
    );
  }
}
