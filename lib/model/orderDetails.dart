// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:whynew_new/model/customer.dart';

// class OrderDetails {

//  List<OrderItems> orderItems;
// Customer customer;
//   OrderDetails({
   
//     this.orderItems,
//     // this.purchasedDatate,
//     // this.orderDeliveredDate,
//     this.customer,

    
//   });
  
//   factory OrderDetails.fromJson(Map<String,dynamic> json){
//     var orderItems = json['orderItems'] as List;
    
//     List<OrderItems> orderItemList = orderItems.map((e) => OrderItems.fromJson(e)).toList();
//   var custDetails = Customer.fromJson(json['customer']);
//     return OrderDetails(
     
//       orderItems: orderItemList,
//        customer: custDetails
//     );
//   }
  
   

//     factory OrderDetails.fromSnapshot(DocumentSnapshot snapshot){
//        var orderItems = snapshot.data()['orderItems'] as List;
//     print("order items from factory: " + orderItems.toString());
//     List<OrderItems> orderItemList = orderItems.map((e) => OrderItems.fromJson(e)).toList();
//   var custDetails = Customer.fromJson(snapshot.data()['customerDetails']);
//       return OrderDetails(
// //  customerId: snapshot.data()['id'],
//       // productName: snapshot.data()['productName'],
//       //imgUrl: json['imgUrl'],
//       // purchasedDate: snapshot.data()['purchasedDate'],  
//       // orderShippedDate: snapshot.data()['purchasedDate'],  
//       // orderDeliveredDate: snapshot.data()['purchasedDate'],  
//       // customerName:snapshot.data()['name'],
//       // price:snapshot.data()['price'],
//       // customerContact:snapshot.data()['customerContact'],
//       // status :snapshot.data()['status'],
//       // imgUrl:snapshot.data()['imgUrl'],
//       // email:snapshot.data()['email'],
//       // dealerId:snapshot.data()['dealerId'],
//       orderItems: orderItemList,
//        customer: custDetails
//       );
  
//     }

// }
// class OrderItems{
//   String productName;
//   String productQty;
//   String productTotal;
//   String productImg;
//   OrderItems({
//     this.productName,
//     this.productImg,
//     this.productQty,
//     this.productTotal,
//   });
//   factory OrderItems.fromJson(Map<String,dynamic> json){
//     return OrderItems(
//       productName : json['productName'],
//       productQty : json['productQty'],
//       productTotal : json['productTotal'],
//       productImg : json['productImg'],
//     );
//   }
// }



 