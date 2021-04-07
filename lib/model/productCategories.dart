import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategories {
  String id;
  String name;
 String icon;
 

  ProductCategories({
    this.id,
    this.icon,
  this.name,
  
  });
  ProductCategories.fromJson(Map<String, dynamic> json):
   this.name =json['name'],
   this.icon =json['icon'];
  
  ProductCategories.fromSnapshot(DocumentSnapshot snapshot):
  this.id=snapshot.id,
    this.name=snapshot.data()['name'],
  //this.supermarketLocation,
  this.icon=snapshot.data()['icon'];

}