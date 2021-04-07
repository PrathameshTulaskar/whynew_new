import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String customerId;
  String customerName;
  String imgUrl;
  Timestamp dob;
  String email;
  String currentAddress;
  String mobileNumber;
 

  Customer({
    this.customerId,
    this.customerName,
    this.imgUrl,
    this.dob,
    this.email,
    this.currentAddress,
    this.mobileNumber,
  
  });
  Customer.fromJson(Map<String, dynamic> json):
   this.customerId =json['customerId'],
   this.customerName =json['customerName'],
   this.imgUrl =json['imgUrl'] ?? "",
   this.dob =json['dob'],
   this.email =json['email'],
   this.mobileNumber =json['mobileNumber'],
   this.currentAddress =json['currentAddress'];

   Customer.fromSnapshot(DocumentSnapshot snapshot):
  this.customerId=snapshot.data()['customerId'],
    this.customerName=snapshot.data()['customerName'],
  //this.supermarketLocation,
  this.imgUrl=snapshot.data()['imgUrl'] ?? "",
  this.dob=snapshot.data()['dob'],
  this.email=snapshot.data()['email'],
  this.currentAddress=snapshot.data()['currentAddress'];

  
}