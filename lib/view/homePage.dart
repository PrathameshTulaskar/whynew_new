import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/model/customer.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/model/productPageArgs.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/slider.dart';

class Homepage extends StatefulWidget {
    final Customer customer;
    final Credentials userData;
  Homepage({Key key,this.customer,this.userData}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool dealer = false;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    // print("here is the customer id${widget.userData.userId}");
    //  print("here is the   ${FirebaseAuth.instance.currentUser.uid}");
    //  print("user Id is here rom appState ${appState.userId}");
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              FullscreenSlider(),
              Center(
                  child: appState.isDealer
                      ? Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.blueGrey[50],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Registration Status:"),
                              // Text(appState.dealerDetails.isApproved == true
                              //     ? 'Aproved'
                              //     : 'Pending'),
                            ],
                          ),
                        )
                      : Container()),
              SizedBox(height: 20),
              Visibility(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: DottedBorder(
                    color: Colors.black,
                    strokeWidth: 1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Today's Sale"),
                            Text("Rs.200000"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total sale"),
                            Text("Rs.200000"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Product Sold"),
                            Text("20"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Approval Pending"),
                            Text("10"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                visible: appState.isDealer,
                replacement: Container(),
              ),
              //     Visibility(
              //                   child: Container(
              //           width:MediaQuery.of(context).size.width ,
              //             margin: EdgeInsets.only(left: 10,right: 10),
              //           child: DottedBorder(

              //  color: Colors.black,
              //   strokeWidth: 1,
              //           child: Column(children: [
              //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text("Today's Sale"),
              //                 Text("Rs.200000"),
              //               ],
              //             ),
              //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text("Total sale"),
              //                 Text("Rs.200000"),
              //               ],
              //             ),
              //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text("Total Product Sales"),
              //                 Text("20"),
              //               ],
              //             ),
              //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text("Approval Pending"),
              //                 Text("10"),
              //               ],
              //             )
              //           ],),
              //                        ),
              //         ),
              //         visible: appState.isAdmin,
              //         replacement:Container(),
              //     ),

              SizedBox(height: 30),
              // Summary(),
              SizedBox(height: 10),
              SectionTitle(title: "New Arrivals"),
              SizedBox(height: 10),
              NewArrivalProductsSlider(),
              
              SizedBox(height: 30),
              SectionTitle(title: "Categories"),
              SizedBox(height: 10),
              CategoriesIconSec(),
              SizedBox(height: 30),
              SectionTitle(title: "Recently Purchased"),
              SizedBox(height: 10),
              RecentProductsSlider(),
              SizedBox(height: 60),
            ]));
  }
}

class CategoriesIconSec extends StatefulWidget {
  const CategoriesIconSec({
    Key key,
  }) : super(key: key);

  @override
  _CategoriesIconSecState createState() => _CategoriesIconSecState();
}

class _CategoriesIconSecState extends State<CategoriesIconSec> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List<Widget>.generate(appState.productCategory.length==null ? 0 : appState.productCategory.length, (index) {
        return Column(
          children: [
            InkWell(
              child: Image.network(appState.productCategory[index].icon,
                  width: 60, height: 60),
              onTap: () => Navigator.pushNamed(context, '/SingleCategory',
  
                  arguments: CategoryPageArgs(
                      categoryId: appState.productCategory[index].id ?? "",
                      categoryName: appState.productCategory[index].name ?? "",
                      svgUrl: appState.productCategory[index].icon ?? "")),
            ),
            Text(appState.productCategory[index].name)
          ],
        );
      }),

    );
  }
}

class NewArrivalProductsSlider extends StatefulWidget {

  const NewArrivalProductsSlider({
    Key key,
  }) : super(key: key);

  @override
  _NewArrivalProductsSliderState createState() =>
      _NewArrivalProductsSliderState();
}

class _NewArrivalProductsSliderState extends State<NewArrivalProductsSlider> {
  @override
  Widget build(BuildContext context) {
     
    final appState = Provider.of<Appstate>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(width: 15),
              ///////////////////Demo Code//////////////////////////////////////
          //  ProductBoxFuture(
          //                         price: '19000',
          //                         imgUrl:"https://images.unsplash.com/photo-1602080858428-57174f9431cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
          //                         name:  "Lenoo Ideapad",

          //                       )






              ////////////////////////////////Actual code//////////////////

              FutureBuilder<List<Product>>(
                future: appState.getNewArrivalProduct(),
                builder: (context, snapshot) {
                  //switchCase Loader

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // print("hellooooooooo:${snapshot.data.length}"),
                        children: List<Widget>.generate(
                            appState.productList == null
                                ? 0
                                : appState.productList.length, (index) {
                                  print("produc Name ${snapshot.data[index].productName}");
                                  print("dealer Detailse ${appState.dealerDetails.dealerName}");
                          return index < 4
                              ? ProductBoxFuture(
                                productDetails: snapshot.data[index],
                                  price: snapshot.data[index].price ?? "",
                                  imgUrl: snapshot.data[index].imgUrl ?? "",
                                  name: snapshot.data[index].productName ?? "",

                                )
                              : Container();
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // print("hellooooooooo:${snapshot.data.length}"),
                        children: List<Widget>.generate(
                            appState.productList == null
                                ? 0
                                : appState.productList.length, (index) {
                                  //  print(snapshot.data[index].productName);
                          return index > 3 && index < 8
                              ? ProductBoxFuture(
                                  productDetails: snapshot.data[index],
                                  price: snapshot.data[index].price ?? "",
                                  imgUrl: snapshot.data[index].imgUrl ?? "",
                                  name: snapshot.data[index].productName ?? "",
                                )
                              : Container();
                        }),
                      ),
                    ],
                  );
                },
              ),

              
            ],
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}

class RecentProductsSlider extends StatefulWidget {
  const RecentProductsSlider({
    Key key,
  }) : super(key: key);

  @override
  _RecentProductsSliderState createState() => _RecentProductsSliderState();
}

class _RecentProductsSliderState extends State<RecentProductsSlider> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(width: 15),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // print("hellooooooooo:${snapshot.data.length}"),
                    children: List<Widget>.generate(
                        appState.recentlyPurchasedProduct == null
                            ? 0
                            : appState.recentlyPurchasedProduct.length,
                        (index) {
                      return index < 4
                          ? ProductBoxFuture(
                            productDetails: appState
                                  .recentlyPurchasedProduct[index],
                              price: appState
                                  .recentlyPurchasedProduct[index].price ?? "",
                              imgUrl: appState
                                  .recentlyPurchasedProduct[index].imgUrl ?? "",
                              name:
                                  appState.recentlyPurchasedProduct[index].productName ??  "",
                            )
                          : Container();
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // print("hellooooooooo:${snapshot.data.length}"),
                    children: List<Widget>.generate(
                        appState.productList == null
                            ? 0
                            : appState.productList.length, (index) {
                      return index > 3 && index < 8
                          ? ProductBoxFuture(
                            productDetails: appState
                                  .recentlyPurchasedProduct[index],
                              price: appState
                                  .recentlyPurchasedProduct[index].price ?? "",
                              imgUrl: appState
                                  .recentlyPurchasedProduct[index].imgUrl ?? "",
                              name:
                                  appState.recentlyPurchasedProduct[index].productName ?? "",
                            )
                          : Container();
                    }),
                  ),
                ],
              ),

              
            ],
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        this.title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class Summary extends StatefulWidget {
  Summary({Key key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20), //padding of outer Container
        child: DottedBorder(
          color: Colors.black, //color of dotted/dash line
          strokeWidth: 2, //thickness of dash/dots
          dashPattern: [6, 8],
          //dash patterns, 10 is dash width, 6 is space width
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's sale"),
                    Text("Rs.20000"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text("Total sale"),
                    Text("Rs.200000"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Product Sold"),
                    Text("20"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Approval products"),
                    Text("10 product"),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}

class ProductBoxFuture extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String price;
  final Product productDetails;
  const ProductBoxFuture({Key key, this.imgUrl, this.name, this.price,this.productDetails})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // 
        // print("product Name ${productDetails.productName}");
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () { 
        // print("ProductDetails  ${productDetails.productName}");
        Navigator.pushNamed(context, '/SingleProduct',
          arguments: productDetails);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),

        borderOnForeground: false,
        color: greyColor,
        // elevation: 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    this.imgUrl,
                    height: 130,
                    fit: BoxFit.contain,
                    width: 130,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(this.name, style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 10),
                  Text("\u20B9 ${this.price}/-",
                      style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
