import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cart.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/model/customer.dart';
import 'package:whynew_new/model/order.dart';
import 'package:whynew_new/model/orderDetails.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/provider/appstate.dart';
// import 'package:whynew_new/view/productCustomerObject.dart';
import 'package:whynew_new/widget/arrowIconButton.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/profileTile.dart';

class CartPage extends StatefulWidget {
 final Credentials userData;
//  final var productStockId;
  CartPage({Key key,
  this.userData,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

var productStockId;
var currentQty;

class _CartPageState extends State<CartPage> {
  Order productId;
  // var productStockId;
  @override
  Widget build(BuildContext context) {
     final appState = Provider.of<Appstate>(context);
     Product args = ModalRoute.of(context).settings.arguments;
    //  print(args.)
    //  print()

      
       
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
              ButtonWithIcon(title: 'Checkout',isHalfPage: true,iconVisible: true,
              onPressed:(){ 
                // print("arguments product ${args.productName}");
              var orderObject=Order(customerAddress: CustomerOrderAddress(area: "",customerLatLng:
           GeoPoint(1,1),houseNo:"6767" ,landMark: "Panjim",location: "",),userId: appState.userId,userContact: "",userName: "",email: "abc",
           orderItems:appState.cartDetail.map((e)=>OrderItems(productImg: e.imgUrl,productId:e.productId,productName: e.productName,productQty: e.productQty.toString(),
           productTotal: "200")).toList(),
           price: "2400", );
           print("orderObject productId ${orderObject.orderItems[0].productId} ,orderObject productId ${orderObject.orderItems[0].productName}");
               print("productImgggg ${orderObject.price}");
                Navigator.pushNamed(context, '/checkout',
          arguments: orderObject
          // arguments:Order(userName: appState.customer.customerName,)
          
          );
        
          }
            ),
              Text("Cash On Delivery",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonCustom(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cart", style: Theme.of(context).textTheme.headline4),
                  SvgPicture.asset(
                    "assets/svg/shopping-cart.svg",
                    width: 25,
                  )
                ],
              ),
            ),
            Column(children: List<Widget>.generate(appState.cartDetail.length,(index)
               
                {
                  // appState.productStockId=appState.cartDetail[index].productId;
                  productStockId=appState.cartDetail[index].productId;
                  //appState.currentQty=appState.cartDetail[index].productQty.toString();
                  currentQty=appState.cartDetail[index].productQty.toString();
                  // productId=appState.cartDetail[index].productId;
                  print(" cart Details length${appState.cartDetail.length}");
                  print("${appState.cartDetail[index].imgUrl} image not found");
                  print("${appState.cartDetail[index].productId} productId In CartPage");
                  return  Column(children: [
       CartItem(

        cartDetails:appState.cartDetail[index],
         imgUrl:appState.cartDetail[index].imgUrl,
         name:appState.cartDetail[index].productName,
         price:appState.cartDetail[index].price,
         productQty:appState.cartDetail[index].productQty.toString(),
       ),
       // Text(appState.productCategory[index].name)
                  ]
    ,);

                }   ),),
            SizedBox(height: 30),
            //  Expanded(
            //                       child: FutureBuilder<List<Cart>>(
            //                    future: appState.fetchCart(),
            //                    builder: (context, snapshot) {
                

            //        return Column(
            //          children: List<Widget>.generate(appState.productCategory.length,(index)
            //     {
            //       return   CartItem(
            //                      name: snapshot.data[index].name,
            //                      price: snapshot.data[index].price,
                                          
            //                                );

            //     }
                          
            //                ),
            //         //  ListView.builder(
            //         //       itemCount: snapshot.data==null ? 0 : snapshot.data.length,
            //         //            itemBuilder: (BuildContext context, int index) {
            //         //            return CartItem(
            //         //              name: snapshot.data[index].name,
            //         //              price: snapshot.data[index].price,
                                          
            //         //                        );
            //         //           },
            //         //          ),
                   
            //        );
                     
            //                    },
            //                  ),
            //     ),
            //CartItem(),
            SizedBox(height: 30),
            ProfileListTile(
              iconPathSvg: "assets/svg/shopping-bag.svg",
              title: "Apply Coupon",
            ),
            CalculationSec(
              amount: "",
              title: "Total",
            ),
            CalculationSec(
              amount: "1200",
              title: "Discout",
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub Total",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Rs. 3800/-")
                    ],
                  ),
                  Divider(
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}



class CalculationSec extends StatelessWidget {
  final String title;
  final String amount;
  const CalculationSec({Key key, this.amount, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(this.title), Text("Rs. " + this.amount + "/-")],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            color: Colors.grey[800],
          ),
        )
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String price;
  final String imgUrl;
  final String productQty;
  final Cart cartDetails;
  const CartItem({

    Key key,
    this.productQty,
    this.imgUrl,
    this.name,
    this.price,
    this.cartDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: greyColordark,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network( this.imgUrl ?? "",
            //    "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                height: 130,
                fit: BoxFit.cover,
                width: 130,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.name ?? "",
                        style: Theme.of(context).textTheme.subtitle1),
                    SizedBox(height: 30),
                    Align(
                      alignment:Alignment.centerRight,
                      child: Container(
                          width: 100,
                          child: Text(
                            "Rs${this.price}/-",
                            textAlign: TextAlign.right,
                          )),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Container(
                            height: 17.0,
                            width: 17.0,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Colors.grey[800], width: 1)),
                            
                              child: Icon(
                                Icons.remove,
                                size: 15.0,
                                color: Colors.grey[800],
                              ),
                              
                            
                          ),
                          onTap:()async{
                              print('productStockId $productStockId');
                              print("productCurrentQty $currentQty");
                              print("productCurrentQty $productStockId");
                         await appState.updateStock(productStockId,currentQty,false);
                            }
                        ),
                        SizedBox(width: 10),
                        Text(this.productQty),
                        SizedBox(width: 20),
                        InkWell(
                          child: Container(
                            height: 17.0,
                            width: 17.0,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Colors.grey[800], width: 1)),
                           
                              child: Icon(
                                Icons.add,
                                size: 15.0,
                                color: Colors.grey[800],
                              ),
                             
                            
                          ),
                          onTap:()async{
                              print('productStockId $productStockId');
                              print("productCurrentQty $currentQty");
                         await appState.updateStock(productStockId,currentQty,true);
                            }
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
