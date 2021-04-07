import 'package:cloud_firestore/cloud_firestore.dart';

class RecentlyPurchased {
  String imgUrl;
  String productName;
  String price;  

  

  Timestamp purchasedDate;
  
 

  RecentlyPurchased({
    
    this.price,
    this.productName,
    this.imgUrl,
    
 
    this.purchasedDate,
    
    
  });
  
  factory RecentlyPurchased.fromJson(Map<String,dynamic> json){
    
  // var custAddress = CustomerOrderAddress.fromJson(json['customerAddress']);
    return RecentlyPurchased(
   
      productName: json['productName'],
      //imgUrl: json['imgUrl'],
      purchasedDate: json['purchasedDate'],  
   
      price:json['price'],
    
      imgUrl:json['imgUrl'],
  

    );
  }
  
   

    RecentlyPurchased.fromSnapshot(DocumentSnapshot snapshot):
    this.price=snapshot.data()['price'],
    this.purchasedDate=snapshot.data()['purchasedDate'],

 this.imgUrl=snapshot.data()['imgUrl'],
 this.productName=snapshot.data()['productName'];

  

}



  