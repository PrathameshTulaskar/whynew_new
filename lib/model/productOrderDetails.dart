import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOrderDetails{
   String contactNumber; 
    String customerAddress;
     String customerId; 
      String customerImgUrl;
     String customerName; 
      String imgUrl;
      String price; 
     String productId;
       String productName;
       Timestamp productPurchasedOn;
  bool status;
  String email;
 
 
 List<OrderItems> orderItems;
//CustomerOrderAddress customerAddress;
  ProductOrderDetails({
    this.customerId,
    this.customerAddress,
    this.customerImgUrl,
    this.price,
    this.productName,
    this.imgUrl,
    this.customerName,
    this.contactNumber,
    this.status,
    this.email,
    this.productId,
    this.orderItems,
    this.productPurchasedOn,

    
  });
  
  factory ProductOrderDetails.fromJson(Map<String,dynamic> json){
    var orderItems = json['orderItems'] as List;
   
    
    List<OrderItems> orderItemList = orderItems.map((e) => OrderItems.fromJson(e)).toList();
  // var custAddress = CustomerOrderAddress.fromJson(json['customerAddress']);
    return ProductOrderDetails(
      customerId: json['id'],
      productName: json['name'],
      customerImgUrl: json['customerImgUrl'],   
      customerAddress: json['customerAddress'],     
      customerName:json['name'],
      price:json['price'],
      contactNumber:json['contactNumber'],
      status :json['status'],
      imgUrl:json['imgUrl'],
      email:json['email'],
      productId:json['productId'],
      productPurchasedOn: json['productPurchasedOn'],
      orderItems: orderItemList,

    );
  }
  
   

    ProductOrderDetails.fromSnapshot(DocumentSnapshot snapshot):
    this.price=snapshot.data()['price'],
  this.customerId=snapshot.data()['customerId'],
  this.customerAddress=snapshot.data()['customerAddress'],
  this.customerName=snapshot.data()['customerName'],
 this.imgUrl=snapshot.data()['imgUrl'],
 this.productName=snapshot.data()['productName'],
  this.contactNumber=snapshot.data()['contactNumber'],
  this.status=snapshot.data()['status'],
  this.email=snapshot.data()['email'],
  this.productId=snapshot.data()['productId'],
  this.productPurchasedOn=snapshot.data()['productPurchasedOn'];
  

}
class OrderItems{
  String productName;
  String productQty;
  String productTotal;
  String productImg;
  OrderItems({
    this.productName,
    this.productImg,
    this.productQty,
    this.productTotal,
  });
  factory OrderItems.fromJson(Map<String,dynamic> json){
    return OrderItems(
      productName : json['productName'],
      productQty : json['productQty'],
      productTotal : json['productTotal'],
      productImg : json['productImg'],
    );
  }
}
