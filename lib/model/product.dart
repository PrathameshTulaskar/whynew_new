

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whynew_new/view/productStatus.dart';

class Product {
  String productId;
  bool status;
  String productName;
  String ram;
 String dealerId;
 String dealerName;
 String price;
 String  imgUrl;
 String  description;
 String condition;
 String brandName;
 String type;
int productQty;
int stockAvailable;
 String category;
 Timestamp productAddedOn;
  
  Product({
    this.productId,
    this.imgUrl,
    this.productName,
    this.dealerName,
  this.productAddedOn,
  this.dealerId,
  this.price,
  this.status,
  this.description,
  this.condition,
this.brandName,
this.type,
this.ram,
this.stockAvailable,
this.category,
this.productQty,
  });
  Product.fromJson(Map<String, dynamic> json):
   this.productId =json['productId'],
   //this.supermarketLocation =json['location']['geopoint'],
   this.productName =json['productName'],
    this.imgUrl = json['imgUrl'],
    this.dealerName=json['dealerName'],
   this.dealerId =json['dealerId'],
   this.ram =json['ram'],
  //  this.productAddedOn=json['productAddedOn'],
   this.price =json['price'],
   this.description =json['description'],
   this.condition=json['condition'],
   this.brandName=json['brandName'],
   this.type=json['type'],
   this.stockAvailable=json['stockAvailable'],
   this.category=json['category'],
   this.productQty=json['productQty'],
    this.status=json['status'];
  
  Product.fromSnapshot(DocumentSnapshot snapshot):
  this.productId=snapshot.id,
    this.productName=snapshot.data()['productName'] ?? "",
    this.imgUrl=snapshot.data()['imgUrl'],
  //this.supermarketLocation,
  this.dealerId=snapshot.data()['dealerId'],
  this.ram=snapshot.data()['ram'],
  this.dealerName=snapshot.data()['dealerName'],
  this.price=snapshot.data()['price'],
  this.stockAvailable=snapshot.data()['stockAvailable'],
  this.description=snapshot.data()['description'],
  this.condition=snapshot.data()['condition'],
this.brandName=snapshot.data()['brandName'],
this.type=snapshot.data()['type'],
this.status=snapshot.data()['status'],
this.productQty=snapshot.data()['productQty'],
this.category=snapshot.data()['category'];
 
}