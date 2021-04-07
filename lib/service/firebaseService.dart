import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';

// import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:whynew_new/model/address.dart';
import 'package:whynew_new/model/cart.dart';
import 'package:whynew_new/model/customer.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/model/order.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/model/productCategories.dart';
import 'package:whynew_new/model/productOrderDetails.dart';
import 'package:whynew_new/model/recentlyPurchased.dart';
import 'package:whynew_new/model/sliderImg.dart';
import 'package:whynew_new/model/wishlist.dart';
//import 'package:groceryvendor/screen/Fishery-Admin/todaysorder.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  // Geoflutterfire geo = Geoflutterfire();




////Products/////
   Future<bool> addProductDetails(
      Product productDetails,String dealerId) async {

   return _db
        .collection("products").add({ 
          'productName': productDetails.productName,
          'productId': productDetails.productId,
          'dealerId': dealerId,
          'price': productDetails.price,
          'ram': productDetails.ram,
          'imgUrl': productDetails.imgUrl,
          'description': productDetails.description,
          'condition': productDetails.condition,
          'brandName': productDetails.brandName,
          //'type': productDetails.type,
          'category': productDetails.category,
          // 'productAddedOn': productDetails.productAddedOn,
  }).then((value) {
      print("data Updated Successfully");
      return true;
    }).catchError((onError) {
      print("error while updating products :$onError");
      return false;
    });
    
  }
  Future<bool> updateProductDetails(
      Product productDetails,String productId ) async {

   return _db
        .collection("products").doc(productId).update({ 
        'productName':productDetails.productName ,
        
  }).then((value) {
      print("Product data updated Successfully");
      return true;
    }).catchError((onError) {
      print("error while update productDetails :$onError");
      return false;
    });
    
  }
  Future<List<Product>> getNewArrivalProduct() async {
 
    {
      try {
           var today=Timestamp.now();
    var response = await _db.collection("products").where('productAddedOn',isLessThanOrEqualTo: today).limit(4).get();
        print("New Arrival Products");
        //  response.docs.forEach((element) {print(element.data());});
        //   return[Product()];
        return response.docs.map((e) => Product.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }
  Future<List<Product>> fetchProducts(String dealerId) async {
    //var response = await _db.collection("products").where("category",isEqualTo:"Laptop" ).get();
    var response = await _db.collection("products").where('dealerId',isEqualTo:dealerId).get();
    print("All Products");
    {
      try {
       print("hey hellloooooooooooooooooooooooo ");
        //  response.docs.forEach((element) {print(element.data());});
        //   return[Product()];
        return response.docs.map((e) => Product.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }
  
  Future<List<Product>> fetchProductByCategory(String categoryName) async {
    //var response = await _db.collection("products").where("category",isEqualTo:"Laptop" ).get();
    var response = await _db.collection("products").where("category",isEqualTo:categoryName).get();
    {
      try {
       print("Category Products");
        //  response.docs.forEach((element) {print(element.data());});
        //   return[Product()];
        return response.docs.map((e) => Product.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }
  // Future<List<Order>> recentlyPurchased() async {
 
  //   {
  //     try {
  //          var today=Timestamp.now();
  //   var response = await _db.collection("products").where('productAddedOn',isLessThanOrEqualTo: today).limit(6).get();
  //       print("ProductList");
  //        // response.docs.forEach((element) {print(element.data());});
  //         //return[Product()];
  //       return response.docs.map((e) => Order.fromSnapshot(e)).toList();
  //     } catch (error) {
  //       print("something wrong $error");
  //       return null;
  //     }
  //   }
  // }

  Future<List<Product>> recentlyPurchased() async {
 
    {
      try {
          
    var response = await _db.collection("recentlyPurchased").get();
        print("Recently  PurchasedList");
// response.docs.forEach((element) {print(element.data());});
//          return[RecentlyPurchased()];
        return response.docs.map((e) => Product.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }
 ////////////////////////////////////product Details////////////////////
  Future<List<ProductOrderDetails>> soldProducts(String dealerId) async {
  {
      try {
           //var today=Timestamp.now();
    var response = await _db.collection("productOrderDetails/$dealerId/productDetails").get();
     print("ProductOrderDetails");
        //   response.docs.forEach((element) {print(element.data());});
        //  return[ProductOrderDetails()];
        return response.docs.map((e) => ProductOrderDetails.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }
 ///////////////////////////////////// ///fetch Product Categories/////////////////////////////////////
  Future<bool> addProductCategories(
      ProductCategories productCategories, ) async {

   return _db
        .collection("productCategories").add({ 
        'name': productCategories.name,
        'icon': productCategories.icon,
   
  }).then((value) {
      print("data Updated Successfully");
      return true;
    }).catchError((onError) {
      print("error while Add products :$onError");
      return false;
    });
    
  }
  
  Future<List<ProductCategories>> fetchProductCategory() async {
    var response = await _db.collection("productCategories").get();
    {
      try {
        print("ProductList $response");
    //       response.docs.forEach((element) {print(element.data());});
    //   print("${[ProductCategories()]}");
    // return [ProductCategories()];
        return response.docs
            .map((e) => ProductCategories.fromSnapshot(e))
            .toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }







/////////////////////////////// Customer Details/////////////////////////////////////
Future<bool> addCustomer(
      Customer customerDetails,String customerId ) async {

   return _db
        .collection("customers").doc(customerId).set({ 
        // 'currentAddress':customerDetails.currentAddress ,
        // 'dob': customerDetails.dob,
        'customerName':customerDetails.customerName,
        'email': customerDetails.email,
        'customerId':customerDetails.customerId ,
       
        'imgUrl':customerDetails.imgUrl ,                                                                                                                                                                                          
        'mobileNumber': customerDetails.mobileNumber,
  }).then((value) {
      print("data Added Successfully");
      return true;
    }).catchError((onError) {
      print("error while add Customer :$onError");
      return false;
    });
    
  }
  Future<bool> updatecustomerDetail(
      Customer customerDetails,String customerId ) async {

   return _db
        .collection("customers").doc(customerId).update({ 
        'currentAddress':customerDetails.currentAddress ,
        'dob': customerDetails.dob,
        'email': customerDetails.email,
        'imgUrl':customerDetails.imgUrl ,                                                                                                                                                                                          
        'mobileNumber': customerDetails.mobileNumber,
  }).then((value) {
      print("data updated Successfully");
      return true;
    }).catchError((onError) {
      print("error while add Customer :$onError");
      return false;
    });
    
  }

  Future<Customer> fetchCustomer(String customerId) async {
    {
      try {
        print("Customer  Data");
        print("Customer Id in th fetchCutsomer $customerId");
   
        var response = await _db.collection("customers").doc(customerId).get();
   print(" hello ${response.data()}");
        return Customer.fromJson(response.data());
      
      } catch (error) {
        print("something wrong  $error");
        return null;
      }
    }
  }
Future<List<Customer>> fetchCustomerhistory() async {
    {
      try {
        var response = await _db.collection("customers").get();
        return response.docs.map((e) => Customer.fromSnapshot(e)).toList();
     } catch (error) {
        print("something wrong  $error");
        return null;
      }
    }
  }






 ///////////////////// ////////////Address////////////////////////////////////////////
  Future<bool> addAddress(
      UserAddress addressDetails,String customerId ) async {

   return _db
        .collection("customers/$customerId/customerLocation").add({ 
        //'landmark':addressDetails,
        'pincode': addressDetails.pincode,
        'area': addressDetails.area,
        'type':addressDetails.type,
        
  }).then((value) {
      print("data added Successfully");
      return true;
    }).catchError((onError) {
      print("error while adding Address :$onError");
      return false;
    });
    
  }
  Future<List<UserAddress>> fetchCustomerAddress(String customerId) async {
    var response = await _db.collection("/customers/$customerId/customerLocation").get();
    {
      try {
        print("Adreeeesss");
      
        return response.docs.map((e) => UserAddress.fromJson(e.data())).toList();
    //  response.docs.map((e) => UserAddress.fromSnapshot(e)).toList();
    // response.docs.forEach((element) {print(element.data());});
    //  return[UserAddress()];
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }


 //////////////////////////////////////////////////// Order Details/////////////////////////////////////////
  Future<String> addOrders(
      Order orderDetails ,String userId) async {
try  { 
  // var customerAddress = {
  //     'area': orderData.customerAddress.area,
  //     'locationPoint': customerAddressPoint.data,
  //     'landmark': orderData.customerAddress.landMark,
  //     'houseNo': orderData.customerAddress.houseNo,
  //     'locationType': orderData.customerAddress.locationType,
  //     'location': orderData.customerAddress.location,
  //   }; 

  var orderItems = [];
    orderDetails.orderItems.forEach((element) {
      var mapping = {
        'productName': element.productName,
        'productId':element.productId,
        'productImg': element.productImg,
        'productQty': element.productQty,
        'productTotal': element.productTotal,
        'stockAvailable':element.stockAvailable,
       
      };
      orderItems.add(mapping);
    });
  print("About To place order");
      var productList = [];
orderDetails.productIds.forEach((element) {
      productList.add(element.productId);
    });
    print("${orderDetails.productIds}");
   var response= await _db
        .collection("orders/$userId/orderList").add({ 
       'productId': orderDetails.productId,
       'productName':orderDetails.productName,
       'userId':userId,
       'productIds':productList,
       'userContact':orderDetails.userContact,
       'status': "Order Placed",
       'email': orderDetails.email,
       'dealerId': orderDetails.dealerId,
       'purchasedDate': orderDetails.purchasedDate,
       'customerAddress':orderDetails.customerAddress,
       'userName':orderDetails.userName,
       'imgUrl':orderDetails.imgUrl,
       'price':orderDetails.price,
       'orderItems':orderItems
       
  }
  );
  return response.id;
  
  }catch (e){
    print(e);
    return null;
  }
    
  }

  Future<List<Order>> fetchOrder(String userId) async {
    var response = await _db.collection("orders").where('userId',isEqualTo: userId).get();
    {
      try {
       return response.docs.map((e) => Order.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong  $error");
        return null;
      }
    }
  }

////////  Cart List//////
Future<bool> addToCart(
      Cart cartDetails,String customerId,String productId ) async {

   try{
     var response = await _db
        .collection("/cart/$customerId/cartProducts").doc(productId).set({ 
       'productName':cartDetails.productName,
       'price':cartDetails.price,
       'stockAvailable':cartDetails.stockAvailable ,
       'category':cartDetails.category,
       'brandName':cartDetails.brandName,
       'condition':cartDetails.condition,
       'productQty':cartDetails.productQty,
       'dealerId':cartDetails.dealerId,
       'dealerName':cartDetails.dealerName,
       'imgUrl':cartDetails.imgUrl,
       'productId':productId,
      
  });
  // print(response);
  return true;
    }catch (error){
        print (error);
    }
    return false;
  }
  Stream<List<Cart>> fetchCart(String userId) {
   try{
    if (userId != null) {
      
      print("get cart item stream fired with USer Id: $userId");
      var response = _db
          .collection("cart/$userId/cartProducts")
          .snapshots();
      return response.map((e) => e.docs.map((e)=>Cart.fromSnapshot(e)).toList());
    } else {
      return null;
    }
    }catch(error){
      print(" error on fetch cart $error");
    }
    // return true;
    
  }

  // Stream<List<Cart>> fetchCart(String userId,)  {
  
    
  //     try {
  //         var response =  _db
  //       .collection("cart/$userId/cartProducts")
  //       .snapshots();
  //       print("CustomerCart $response");
  //   //          // response.docs.forEach((element) {print(element.data());});
  //   //  return[UserAddress()];
  //       return response.map((e) => e.docs.map((e)=>Cart.fromSnapshot(e)).toList());
  //     } catch (error) {
  //       print("something wrong $error");
  //       return null;
  //     }
   
  // }
 

 Future<void>updateStock(String userId,String productId,bool isAdd,String currentQty)async{
   try{
     int currentQtyint= int.parse(currentQty);
   if(isAdd){
      var calc=currentQtyint +1;
      if(currentQtyint==0){
      await _db
        .collection("cart/$userId/cartProducts").doc("$productId").delete();
      }else{
     await _db
        .collection("cart/$userId/cartProducts").doc("$productId").update({
        'productQty':calc
        }
          
        );
      }

   }else{
      var calc=currentQtyint -1;
      if(currentQtyint==0){
         await _db
        .collection("cart/$userId/cartProducts").doc("$productId").delete();
       
      }else{
 await _db
        .collection("cart/$userId/cartProducts").doc("$productId").update({
        'productQty':calc
        }
        );
      }

   }
   }catch(error){
     print("Error Adding Customer:$error");
   }
  
 }


////////get WishList//////
  Future<List<WishList>> fetchWishlist(customerId) async {
    var response = await _db
        .collection("orders/$customerId/cartProducts")
        .get();
    {
      try {
        return response.docs.map((e) => WishList.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong $error");
        return null;
      }
    }
  }
/////////////////////###################Dealer############################/////////////////////////////
 Future<bool> addDealer(
      Dealer dealerDetails,String dealerId ) async {

   try{
     var response= await  _db
        .collection("dealers").doc(dealerId).set({ 
        // 'currentAddress':customerDetails.currentAddress ,
        // 'dob': customerDetails.dob,
        'dealerName':dealerDetails.dealerName,
        'email': dealerDetails.email,
        'dealerId':dealerDetails.dealerId ,
        'imgUrl':dealerDetails.imgUrl ,                                                                                                                                                                                          
        'contactNumber': dealerDetails.contactNumber,
        'isDealer': dealerDetails.isDealer,
        'isAdmin': dealerDetails.isAdmin,
        'isApproved':false
        
  });
  print([response]);
  
  return true;
  }catch (err){
    print(err);
    return false;
  }
    
  }
  Future<bool> updateDealerDetails(
      Dealer dealerDetails,String dealerId ) async {

   return _db
        .collection("dealer").doc(dealerId).update({ 
        'currentAddress':dealerDetails.currentAddress ,
        'dob': dealerDetails.dob,
        'email': dealerDetails.email,
        'imgUrl':dealerDetails.imgUrl ,                                                                                                                                                                                          
        'mobileNumber': dealerDetails.contactNumber,
  }).then((value) {
      print("Dealer data updated Successfully");
      return true;
    }).catchError((onError) {
      print("error while add Customer :$onError");
      return false;
    });
    
  }

 Future<Dealer> fetchDealer(String dealerId) async {
    {
      try {
        print("Dealerdata");
        
     var response = await _db.collection("dealers").doc("$dealerId").get();
    //  print("response for dealerDetails is ${[response]}");
  print(" hello Dealer ${response.data()}");
    
    return Dealer.fromJson(response.data());
        } catch (error) {
        print("something wrong  $error");
        return null;
       
      }
    }
  }

   
Future<List<Dealer>>nonApprovedDealers( )async{
  {
    try{
      var response = await _db.collection("dealers").where("isApproved",isEqualTo: false).get();
    return response.docs.map((e) => Dealer.fromSnapshot(e)).toList();
      }catch (error) {
      print("$error");
      return null;
          }
  }
}
// Future<List<Dealer>>approveDealerProducts( )async{
//   {
//     try{
//       var response = await _db.collection("products").where("status",isEqualTo: false).get();
//     return response.docs.map((e) => Dealer.fromSnapshot(e)).toList();
//       }catch (error) {
//       print("$error");
//       return null;
//           }
//   }
// }

Future<bool> updateDealerStatus(Dealer dealerDetails,String dealerId) {
  { 
   try {return _db
        .collection("dealers")
        .
        doc(dealerId)
        .update({'isApproved': true});
        }catch (error) {
          print("$error"); 
        }
  }return null;
}
  ///////////////////////////////////####################Slider###########################//////////////////////////////////

 Future<List<SliderImg>> getSliderImages() async {
    {
      try {
         var response = await _db.collection("slider").get();
    return response.docs.map((e) => SliderImg.fromSnapshot(e)).toList();
      } catch (error) {
        print("something wrong  $error");
        return null;
      }
    }
  }

  ////////////////////////////////GUEST//////////////////////////////////////
  
  Future<bool> addGuest() async {

   return _db
        .collection("guest").add({     
  }).then((value) {
      print("data added Successfully");
      return true;
    }).catchError((onError) {
      print("error while adding Address :$onError");
      return false;
    });
     }

Future<void>fetchGuest()async{
var response=await _db.collection("guest").get();
return response;
}

}
