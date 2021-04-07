import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/model/order.dart';
import 'package:whynew_new/service/cartProductExist.dart';
// import 'package:whynew_new/model/cart.dart';
// import 'package:whynew_new/service/cartProductExist.dart';
// import 'package:whynew_new/view/cart.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/getOtpBtn.dart';
import 'package:whynew_new/widget/header.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/product.dart';

class SingleProduct extends StatefulWidget {

  final String description;
  final String condition;
  final String brandName;
  final String name;
  final String price;
  final String imgUrl;
  final String type;
  SingleProduct({Key key,
  this.description,
  this.condition,
  this.brandName,
  this.name,
  this.price,
  this.imgUrl,
  this.type,
  
  
  }) : super(key: key);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  bool wishlist = false;
  bool flag = true;
  final List<String> imgList = [
    'https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png',
    'https://www.whynew.in/wp-content/uploads/2019/07/Hp-elite-book-840-G1.jpg',
    'https://www.whynew.in/wp-content/uploads/2019/07/hp-elitebook-840.jpg',
  
    
  ];

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    Product args = ModalRoute.of(context).settings.arguments;
    final String description =
        args.description ??"widget.description";
  
    
    String visibleDescription = "";
    String moreDescription = "";


    if (description.length > 300) {
      setState(() {
        visibleDescription = description.substring(0, 300);
        moreDescription = description.substring(300, description.length);
      });
    } else {
      setState(() {
        visibleDescription = description;
        moreDescription = "";
      });
    }
    return SafeArea(
      child: Scaffold(
        appBar: header(context,Padding(
          padding: const EdgeInsets.only(bottom:6.0),
          child: BackButtonCustom(),
        ),Container()),
        // drawer: HeaderMenu(),
        bottomNavigationBar: BottomButtonsProductPage(product: args, ),
        body: SingleChildScrollView(
          child: 
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BackButtonCustom(),
                // SizedBox(height: 10),
                
                
                ProductSlider(imgList: imgList),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10),
                              child: 
                              Text(args.productName ?? "",style: Theme.of(context).textTheme.headline6)
                              // Text( "Abcdefg",
                              //     style: Theme.of(context).textTheme.headline6),
                            ),
                            wishlistBtn(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(args.price ??
                                "\u20B9",
                              // Text(
                              //   "\u20B9",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(width: 3),
                              Text(widget.price ?? "",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        descriptionProduct(context, visibleDescription, moreDescription),
                        SizedBox(height: 15),
                        ProductMoreInfo(
                          
                          backgroundColor: Theme.of(context).canvasColor,
                          title: "Condition:",
                          value: args.condition ?? "",
                          // value:"vsvdfbbbcvbvnnbvv",
                        ),
                        SizedBox(height: 15),
                        ProductMoreInfo(
                          backgroundColor: greyColordark,
                          title: "Brand Name:",
                          // value: 'xfdgfbvbvbngfh',
                          value:args.brandName ?? '',
                        ),
                        SizedBox(height: 15),
                        ProductMoreInfo(
                          backgroundColor: Theme.of(context).canvasColor,
                          title: "Product Type:",
                          value: args.type ?? '',
                          
                          // value:'gfdhghhjkhjkjjh',
                        ),
                        SizedBox(height: 15),
                      ],
                    ))
              ],
            )
           
         
        ),
      ),
    );
  }

  Container descriptionProduct(BuildContext context, String visibleDescription, String moreDescription) {
    return Container(
                        decoration: BoxDecoration(color: greyColordark),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Description",
                                  style:
                                      Theme.of(context).textTheme.headline6),
                              SizedBox(height: 15),
                              new Text(flag
                                  ? (visibleDescription + "...")
                                  : (visibleDescription + moreDescription)),
                              new InkWell(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    new Text(
                                      flag ? "Read more" : "show less",
                                      // style: new TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(width: 3),
                                    Icon(
                                      Icons.arrow_drop_down_circle,
                                      size: 15,
                                    )
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    flag = !flag;
                                  });
                                },
                              ),
                            ],
                          ),
                        ));
  }

  FlatButton wishlistBtn() {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      onPressed: () {
        if (wishlist) {
          setState(() {
            wishlist = false;
          });
        } else {
          setState(() {
            wishlist = true;
          });
        }
      },
      child: Visibility(
        child: SvgPicture.asset(
          "assets/svg/heartProductFill.svg",
          width: 24.0,
        ),
        replacement: SvgPicture.asset(
          "assets/svg/heartProduct.svg",
          width: 24.0,
        ),
        visible: wishlist,
      ),
    );
  }
}

class ProductMoreInfo extends StatelessWidget {
   final String title;
  final String value;
  final Color backgroundColor;
  const ProductMoreInfo({
    Key key,
    @required this.backgroundColor,
    @required this.title,
    @required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.backgroundColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(-3.0, 3.0),
                blurRadius: 2,
                spreadRadius: 0.01,
                color: Colors.grey),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(this.title,
                style: Theme.of(context).textTheme.subtitle2),
            Text(this.value,
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ),
    );
  }
}

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    Key key,
    @required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(viewportFraction: 1),
      items: imgList
          .map((item) => Container(
                child: Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000)),
              ))
          .toList(),
    ));
  }
}

class BottomButtonsProductPage extends StatelessWidget {
  final Product product;
      final Credentials userData;
  const BottomButtonsProductPage({
    Key key,
    this.userData,
    this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    //   var children = <Widget>[];
    // final cartItems = appState.cartDetail;
     Product args = ModalRoute.of(context).settings.arguments;
    //    var productExistInCart ;
    return Row(

      children: [ChatButton(),Visibility(
        child: AddToCartBtn(onPressed:(){
     
                  appState.addToCart(product,product.productId);
                  arguments:Product(productId:product.productId,productName:args.productName,dealerId:args.dealerId,price:args.price,imgUrl:args.imgUrl,);
                  print("productdetailsabcdegffffgf   ${product.productId}");
                

        }
           ),
           visible:!appState.isGuest,
           replacement:AddToCartBtn(
             onPressed:() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context)
                          // return StatefulBuilder(builder: (context, setState)
                          {
                    
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return new AlertDialog(
                              title: new Text('You are Not LogIn'),
                              content: new SingleChildScrollView(
                                child: Container(
                                  height:200,
                                  width:400,
                                  child: Column(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
//
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Text("Please Login",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            SizedBox(width: 100),
                                           
                                           
                                          ],
                                        ),
                                      ),

                                    Row(
                                      children: [
                                        FlatButton(
                                          child:Container(
                                             height:80,
                                            width:MediaQuery.of(context).size.width*0.40,
                                            decoration:BoxDecoration(color:Colors.green),
                                            child:Text("Login"),
                                           
                                          ),
                                           onPressed:(){}
                                        ),
                                        FlatButton(
                                          child:Container(
                                            height:80,
                                            width:MediaQuery.of(context).size.width*0.40,
                                            decoration:BoxDecoration(color:Colors.red),
                                            child:Text("Cancle"),
                                           
                                          ),
                                           onPressed:(){}
                                        )
                                        // GetOtpBtn(title:"Login"),
                                        // GetOtpBtn(title:"Cancle"),

                                      ],
                                    ),



                                      
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      );
                }
           )
      ),]
      // Selector<Appstate, List<Product>>(
      //           builder: (context, data, child) {
      //             print("object ${data.length}");
      //             data.forEach((element) {
                    // var productExistInCart =
                    //     cartProductExist(element, cartItems);
      //               children.add(AddToCartBtn(
               
      //                 onPressed: () async {
      //                   print("click");
      //                   try {
                       
      //                     if (!productExistInCart.productExist) {
      //                       await appState.addToCart(product.imgUrl,product.condition,product.dealerId,product.dealerName,
      //                       product.price,product.productId,product.brandName,product.productName,product.category,product.description,product.productQty,product.stockAvailable);
      //                     }
      //                     else{}
      //                   } catch (err) {
      //                     print("add to cart error : $err");
      //                     print("show toast something went wrong try again");
      //                   }
      //                 },
      //               ));
      //             });
      //             return Container();
      //           },
      //           selector: (buildContext, appstate) =>
      //               appstate.productDetails),
        
     
    );
  }
}

class AddToCartBtn extends StatelessWidget {
  final Function onPressed;
  const AddToCartBtn({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            // topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            // bottomRight: Radius.circular(8.0)
          )),
      width: MediaQuery.of(context).size.width * 0.50,
      height: 50,
      child: FlatButton(
        // color:Colors.green,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/shopping-cart.svg",
              width: 20,
              color: Colors.white,
            ),
            SizedBox(width: 15),
            Text("ADD TO CART",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white))
          ],
        ),
      ),
    );
  }
}

class ChatButton extends StatelessWidget {
  const ChatButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 1),
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8.0))),
      width: MediaQuery.of(context).size.width * 0.50,
      height: 50,
      child: FlatButton(
        // color:Theme.of(context).primaryColor,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svg/chat.svg",
                width: 20, color: Theme.of(context).primaryColor),
            SizedBox(width: 15),
            Text("CHAT", style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      ),
    );
  }
}
