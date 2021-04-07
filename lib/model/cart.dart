

import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String productId;
String productName;
 String dealerId;
 String dealerName; //
 String price;
 String  imgUrl;
 String userId;
 
 String condition;
 String brandName;
 String category;
 int  stockAvailable;
 int productQty;
 
  Cart({
    this.productId,
    this.productName,
    this.imgUrl,
  //this.supermarketLocation,
  this.dealerId,
  this.price,
   this.dealerName,
  this.condition,
this.brandName,
this.userId,
// this.type,
this.category,
this.stockAvailable,
this.productQty,
  });
  Cart.fromJson(Map<String, dynamic> json):
   this.productId =json['productId'],
   //this.supermarketLocation =json['location']['geopoint'],
   this.productName =json['productName'],
   this.dealerName =json['dealerName'],
   this.stockAvailable =json['stockAvailable'],
   this.productQty =json['productQty'],
   this.dealerId =json['dealerId'],
   this.imgUrl=json['imgUrl'],
   this.userId=json['userId'],
   this.price =json['price'],
   this.condition=json['condition'],
   this.brandName=json['brandName'],
   this.category=json['category'];
  

  Cart.fromSnapshot(DocumentSnapshot snapshot):
  this.productId=snapshot.id,
  this.productName=snapshot.data()['productName'] ?? "",
  this.dealerName=snapshot.data()['dealerName']??"",
  this.stockAvailable=snapshot.data()['stockAvailable']?? "",
  this.productQty=snapshot.data()['productQty']?? "",
  this.dealerId=snapshot.data()['dealerId']?? "",
  this.imgUrl=snapshot.data()['imgUrl']?? "",
  this.price=snapshot.data()['price'] ?? "",
  this.condition=snapshot.data()['condition']?? "",
  this.brandName=snapshot.data()['brandName']?? "",
  this.userId=snapshot.data()['userId']?? "",
  this.category=snapshot.data()['category']?? "";

 
}