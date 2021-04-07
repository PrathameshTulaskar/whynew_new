import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/pageLabel.dart';

class DealerPurchasedList extends StatefulWidget {
  DealerPurchasedList({Key key}) : super(key: key);

  @override
  _DealerPurchasedListState createState() => _DealerPurchasedListState();
}

class _DealerPurchasedListState extends State<DealerPurchasedList> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonCustom(),
              PageLabel(label: "My Orders"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
           
                children:List<Widget>.generate(appState.orderList.length==null ? 0 :appState.orderList.length,(indexOut){

                    // print("error ${appState.orderList.length}");
                    // print("order items error ${appState.orderList[indexOut].orderItems.length}");
                  return Column(children:
                   List<Widget>.generate(appState.orderList[indexOut].orderItems.length,(index){
                     DateFormat formatter = DateFormat("dd-MM-yyyy hh:mm ").add_jm();
                   String formatted = formatter.format(appState.orderList[indexOut].purchasedDate.toDate());
                   print("$formatted date time example");
                     return   OrderTile(
                amount: appState.orderList[indexOut].orderItems[index].productTotal,
                orderStatus: appState.orderList[indexOut].status ==true ? 1:2,
                productTitle:appState.orderList[indexOut].orderItems[index].productName,
                productUrl:appState.orderList[indexOut].orderItems[index].productImg ,
                time: formatted,
              );
               
                   }));
                    
                }
                              
                               )),
              
              // OrderTile(
              //   amount: "Rs. 23000/-",
              //   orderStatus: 1,
              //   productTitle: "Lenovo IdeaPad",
              //   productUrl: "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
              //   time: "10:30am",
              // ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final String productTitle;
  final String amount;
  final String time;
  ///1 - delivered , 2 - packed, 3 - cancelled
  final int orderStatus;
  final String productUrl;
  
  const OrderTile({
    Key key,
    this.amount,
    this.orderStatus,this.productTitle,this.productUrl,this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color orderStatusColor = orderStatus == 1 ? Colors.green : orderStatus == 2 ? Colors.orange : Colors.red;
    String orderStatusValue =  orderStatus == 1 ? "Approved" : orderStatus == 2 ? "Pending" : "Cancelled";
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ''),
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          // color: greyColordark,
          width: MediaQuery.of(context).size.width,
          child: Card(

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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
          child: Container(
            decoration: BoxDecoration(
              color: greyColordark,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.network(
                // "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                this.productUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
                  ),
                  SizedBox(
          width: 10,
                  ),
                  Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.productTitle,
                    style: Theme.of(context).textTheme.headline6,
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 35,
                child: Text(
                  "RS.${this.amount}/-",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    this.time,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  )
                ],
              ),

              // SizedBox(height: 10,),
            ],
          ),
                  ),
                  Container(
          // color: Colors.orange,
          width: 20,
          height: 110,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(8.0)),
              color: orderStatusColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.vertical,
                children: [
                  RotatedBox(
                      quarterTurns: -1,
                      child: Text(orderStatusValue,
                          style: TextStyle(
                              color: Colors.white, letterSpacing: 5)))
                ]),
          ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
