import 'package:cloud_firestore/cloud_firestore.dart';

class UserAddress {

  

// GeoPoint supermarketLocation;
 GeoPoint location;
 String pincode;
 String landMark;
 String  area;

 String type; 

  UserAddress({
    this.pincode,
    this.landMark,
  this.location,
  

  this.area,
  this.type,

  });
  UserAddress.fromJson(Map<String, dynamic> json):
  
   //this.supermarketLocation =json['location']['geopoint'],
   this.pincode =json['pincode'],
   this.location =json['location']['geopoint'],
   this.landMark =json['landmark'],
   this.area =json['area'];
   //this.type =json['type'];

   UserAddress.fromSnapshot(DocumentSnapshot snapshot):
   this.area=snapshot.data()['area'],
  this.pincode=snapshot.data()['pincode'],
  
   this.location=snapshot.data()['location'],
  //this.supermarketLocation,
  this.landMark=snapshot.data()['landmark'];
  
 // this.type=snapshot.data()['type'];
  
}