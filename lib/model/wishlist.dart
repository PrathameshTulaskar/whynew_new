

import 'package:cloud_firestore/cloud_firestore.dart';

class WishList {
  String id;
  
String name;
 //GeoPoint supermarketLocation;
 String dealer;
 String price;
 String  imgUrl;
 String  description;
 String condition;
 String brandName;
 String type;
 String category;
 //timestamp//String productAddedOn; 

  WishList({
    this.id,
    this.name,
  //this.supermarketLocation,
  this.dealer,
  this.price,
  this.description,
  this.condition,
this.brandName,
this.type,
this.category,
  });
  WishList.fromJson(Map<String, dynamic> json):
   this.id =json['id'],
   //this.supermarketLocation =json['location']['geopoint'],
   this.name =json['name'],

   this.dealer =json['dealer'],
   
   this.price =json['price'],
   this.description =json['description'],
   this.condition=json['condition'],
   this.brandName=json['brandName'],
   this.type=json['type'],
   this.category=json['category'];

   WishList.fromSnapshot(DocumentSnapshot snapshot):
  this.id=snapshot.data()['id'],
    this.name=snapshot.data()['name'],
  //this.supermarketLocation,
  this.dealer=snapshot.data()['dealer'],
  this.price=snapshot.data()['price'],
  this.description=snapshot.data()['description'],
  this.condition=snapshot.data()['condition'],
this.brandName=snapshot.data()['brandName'],
this.type=snapshot.data()['type'],
this.category=snapshot.data()['category'];
  

 
}