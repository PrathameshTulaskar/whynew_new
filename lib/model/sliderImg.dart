

import 'package:cloud_firestore/cloud_firestore.dart';

class SliderImg {
 String imgUrl;
 
 //timestamp//String productAddedOn; 

  SliderImg({
   this.imgUrl,
 
  });
  SliderImg.fromJson(Map<String, dynamic> json):
   this.imgUrl =json['imgUrl'];
   //this.supermarketLocation =json['location']['geopoint'],
  //  this.imgUrl2 =json['imgUrl2'],

  //  this.imgUrl3 =json['imgUrl3'];
  

  SliderImg.fromSnapshot(DocumentSnapshot snapshot):
  this.imgUrl=snapshot.data()['imgUrl'];
  //   this.imgUrl2=snapshot.data()['imgUrl2'],
  // //this.supermarketLocation,
  // this.imgUrl3=snapshot.data()['imgUrl3'];

 
}