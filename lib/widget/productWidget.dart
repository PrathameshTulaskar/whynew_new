import 'package:flutter/material.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/model/productPageArgs.dart';

import 'color.dart';

class ProductBox extends StatelessWidget {
  final String name;
  final String imgUrl;
  final String price;
  final Function onPressed;
  final Product product;

  const ProductBox({Key key,
  this.imgUrl,
  this.name,
  this.price,
  this.onPressed,
  this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
     // onPressed:onPressed ?? ()=> Navigator.pushNamed(context, '/SingleProduct',arguments: ProductPageArgs(productId: 1)),
       onPressed:onPressed,
          child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          side: BorderSide(color: Theme.of(context).primaryColor,width: 1)
        ),
        
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),),
                child: Image.network(this.imgUrl ?? "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",height: 130,fit: BoxFit.contain,width: 130,)),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height:10),
              Text(this.name?? "",style:Theme.of(context).textTheme.caption),
              SizedBox(height:10),
              Text("\u20B9 ${this.price}/-",style:Theme.of(context).textTheme.caption),
              SizedBox(height:10),
            ],),)
          ],
        ),
      ),
    );
  }
}