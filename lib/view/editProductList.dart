import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/header.dart';

class EditProductList extends StatefulWidget {
  EditProductList({Key key}) : super(key: key);

  @override
  _EditProductListState createState() => _EditProductListState();
}

class _EditProductListState extends State<EditProductList> {
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
    // print("arguments ${[args]}");
    final String description =
    args.description??
       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard  dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Let raset sheets containing Lorem Ipsum passages, and";
    // ProductPageArgs args = ModalRoute.of(context).settings.arguments;
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
     
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BackButtonCustom(),

              FlatButton(child: Text("Edit"),
              onPressed:(){appState.productNameController.text =args.productName;
              appState.priceController.text =args.price;appState.dropDownBrand = args.brandName;
              appState.descriptionController.text=args.description;appState.dropDownCondition=args.condition;
                Navigator.pushNamed(context,'/singleItem',arguments: CategoryPageArgs(
                  categoryId:'',categoryName: args.category,svgUrl: '',
                )
                );
                }),
              // arguments:Product(productName:args.productName))),
              SizedBox(height: 10),
              
              ProductSlider(imgList: imgList),
              SizedBox(height: 10),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                  Container(height: 60,width: 60,decoration:BoxDecoration(color: Colors.grey[300]),
                  ),
                  
                  Container(height: 60,width: 60,decoration:BoxDecoration(color: Colors.grey[300])),
                  
                  Container(height: 60,width: 60,decoration:BoxDecoration(color: Colors.grey[300]),
                  ),
                 
                  Container(height: 60,width: 80,decoration:BoxDecoration(color: Colors.grey[300]),child:Column(
                    children: [
                      Icon(Icons.add),
                      Text("Add More")
                    ],
                  ))
                  
                    
                  ],
                ),
              ),
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
                            child: Text( args.productName ??"Problem",
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          wishlistBtn(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Text(
                              "\u20B9",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(width: 3),
                            Text(args.price ??"29,000/-",
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
                        value: args.condition?? "Brand New",
                      ),
                      SizedBox(height: 15),
                      ProductMoreInfo(
                        backgroundColor: greyColordark,
                        title: "Brand Name:",
                        value: args.brandName??"Lenovo",
                      ),
                      SizedBox(height: 15),
                      ProductMoreInfo(
                        backgroundColor: Theme.of(context).canvasColor,
                        title: "Product Type:",
                        value: args.type ?? "Laptop",
                      ),
                      SizedBox(height: 15),
                    ],
                  ))
            ],
          ),
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




