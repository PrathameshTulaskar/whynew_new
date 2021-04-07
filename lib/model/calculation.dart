

import 'package:cloud_firestore/cloud_firestore.dart';

class Calculation {

  int total;
  int deliveryCharges;
  int subTotatl;


  Calculation({

    this.total,
    this.deliveryCharges,
    this.subTotatl,
    
  });
  Calculation.fromJson(Map<String, dynamic> json):
  this.total =json['total'],
  this.deliveryCharges =json['deliveryCharges'],
  this.subTotatl =json['subTotatl'];

 
  //  this.category=json['category'];
  

  Calculation.fromSnapshot(DocumentSnapshot snapshot):
 
// this.category=snapshot.data()['category']
this.subTotatl=snapshot.data()['subTotatl'],
this.deliveryCharges=snapshot.data()['deliveryCharges'],
this.total=snapshot.data()['total'];

// 
 
}