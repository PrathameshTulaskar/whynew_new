

import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  String id;
  
String name;
Timestamp dob;

 String  imgUrl;
 String  email;
 int contactNumber;

  
  Admin({
    this.id,
    this.imgUrl,
    this.name,
    this.dob,
    this.contactNumber,
    this.email,
    
 
  });
  Admin.fromJson(Map<String, dynamic> json):
   this.id =json['id'],
   //this.supermarketLocation =json['location']['geopoint'],
   this.name =json['name'],
    this.imgUrl = json['imgUrl'],
   this.dob =json['dob'],
   this.contactNumber=json['contactNumber'],
   this.email =json['email'];
  
  Admin.fromSnapshot(DocumentSnapshot snapshot):
  this.id=snapshot.data()['id'],
    this.name=snapshot.data()['name'],
    this.imgUrl=snapshot.data()['imgUrl'],
  //this.supermarketLocation,
 this.contactNumber=snapshot.data()['contactNumber'],

this.email=snapshot.data()['email'];
 
}