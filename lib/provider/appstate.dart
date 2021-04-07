import 'dart:core';
// import 'dart:wasm';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart' as prathameshAddress;
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whynew_new/model/address.dart' ;
import 'package:whynew_new/model/cart.dart';
import 'package:whynew_new/model/customer.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/model/guest.dart';
import 'package:whynew_new/model/order.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/model/productCategories.dart';
import 'package:whynew_new/model/productOrderDetails.dart';
import 'package:whynew_new/model/sliderImg.dart';
import 'package:whynew_new/model/wishlist.dart';
import 'package:whynew_new/service/firebaseService.dart';
import 'package:location/location.dart' as locationPermission;

class Appstate extends ChangeNotifier{
  // bool dealer=false;
  // set dealerSetter(value){
  //     dealer= value;
  //     notifyListeners();
  // }
// var userId=FirebaseAuth.instance.currentUser.uid;
  var _userId = FirebaseAuth.instance.currentUser.uid;
  get userId => _userId;
  
  // get userId => _userId;
  String userAddress;

   String _dropDownRam="4GB";
   String get dropDownRam => _dropDownRam;

  set dropDownValue(newValue) {
    _dropDownRam = newValue;
    notifyListeners();
  }
   String _dropDownBrand="Lenovo";
   String get dropDownBrand => _dropDownBrand;

  set dropDownBrand(newValue) {
    _dropDownBrand = newValue;
    notifyListeners();
  }
   String _dropDownCategory="Laptop";
   String get dropDownCategory => _dropDownCategory;

  set dropDownCategory(newValue) {
    _dropDownCategory = newValue;
    notifyListeners();
  }
   String _dropDownCondition="Brand New";
   String get dropDownCondition => _dropDownCondition;

  set dropDownCondition(newValue) {
    _dropDownCondition = newValue;
    notifyListeners();
  }

  var _limitStockList=<int>[];
  bool _limitedStockWarn=false;
  
  
  bool _isClient = true;
  bool get isClient => _isClient;

  set isClient(bool newValue) {
    _isClient= newValue;
    notifyListeners();
  }
  bool _isDealer = false;
  bool get isDealer => _isDealer;

  set isDealer(bool newValue) {
    _isDealer = newValue;
    notifyListeners();
  }
  bool _isGuest = false;
  bool get isGuest => _isGuest;

  set isGuest(bool newValue) {
    _isGuest = newValue;
    notifyListeners();
  }
  
  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool newValue) {
    _isAdmin = newValue;
    notifyListeners();
  }
  bool _dealerActive = false;
  bool get dealerActive => _dealerActive;
  set setDealerActive(value) {
    _dealerActive = value;
    notifyListeners();
  }
  bool _isApprove= false;
  bool get isApprove => _isApprove;

  set isApprove(bool newValue) {
    _isApprove = newValue;
    notifyListeners();
  }
  bool _isUpdate= false;
  bool get isUpdate => _isUpdate;

  set isUpdate(bool newValue) {
    _isUpdate = newValue;
    notifyListeners();
  }
  FirestoreService firebaseService = FirestoreService();

  // String ram ;
  // String ramvalue ;
  // set ramValue(value){
  //   currentIndexFooter = value;
  // }
  // set ramValueSetter(value){
  //   sliderIndex = value;
  //   notifyListeners();
  // }

  int currentIndexFooter = 0;

  int sliderIndex = 0;
  set currentIndexFooterSetter(value){
    currentIndexFooter = value;
  }
  set currentSliderIndexSetter(value){
    sliderIndex = value;
    notifyListeners();
  }
  // UserAddress _position;

  // LatLng userAddress
  // LatLng _userAddress;
  // LatLng get userAddress => _userAddress;
  // set userAddressSetter(value) {
  //   _userAddress = value;
  //   notifyListeners();
  // }
 
  List<UserAddress> _addressDetails=[];
  List<UserAddress> get addressDetails => _addressDetails;
  List<Product> _productList=[] ;
  List<Product> get productList => _productList;
  List<Order> _orderDetails=[] ;
  List<Order> get orderDetails => _orderDetails;
  List<Product> _recentlyPurchased=[] ;
  List<Product> get recentlyPurchasedProduct => _recentlyPurchased;
  List<ProductOrderDetails> _soldProduct=[] ;
  List<ProductOrderDetails> get soldProduct => _soldProduct;
  List<Dealer> _dealerList=[]  ;
  List<Dealer> get dealerList => _dealerList;
  List<SliderImg> _sliderList=[];
  List<SliderImg> get sliderList => _sliderList;
  List<ProductCategories> _productCategory=[];
  List<ProductCategories> get productCategory => _productCategory;
  Customer _customerDetails;
  Customer get customer =>_customerDetails;
  List<Customer> _customerList=[];
  List<Customer> get customerList=>_customerList;
  Dealer _dealerDetails;
  Dealer get dealerDetails=>_dealerDetails;
  List<Order> _orderList=[];
  List<Order> get orderList => _orderList;
  List<UserAddress> _address=[];
  List<UserAddress> get address=>_address;
  List<Product> _productDetails=[];
  List<Product> get productDetails=>_productDetails;
  List<Cart> _cartDetail=[];
  List<Cart> get cartDetail=>_cartDetail;

    TextEditingController strorageController = TextEditingController();
    TextEditingController areaController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController modelNoController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController landMarkController = TextEditingController();
    TextEditingController pinCodeController = TextEditingController();
    TextEditingController brandNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
    TextEditingController contactNumberController = TextEditingController();
     TextEditingController currentAddressController = TextEditingController();
     TextEditingController conditionController = TextEditingController();
     TextEditingController productNameController = TextEditingController();
     TextEditingController birthDateController = TextEditingController();
    

    //  TextEditingController productNameController = TextEditingController();
    // TextEditingController pinCodeController = TextEditingController();
    // TextEditingController pinCodeController = TextEditingController();
    // TextEditingController pinCodeController = TextEditingController();
    // TextEditingController pinCodeController = TextEditingController();
  //FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Appstate(){
    print(
      "App State initialized"

    );
    // addGuest();
    recentlyPurchased();
    // soldProducts();
    // fetchCustomerList();
    // fetchDealerList();
    fetchOrder();
    getSliderImages();
    // //fetchDealerList();
    // fetchAddressDe
    // addDealer();
    // updateProductDetails();
    // addOrder(orderDetails,userId);
// addCustomer();
      // fetchCart("$userId");
   fetchCart();
    fetchCustomerDetails();
    fetchDealerDetails();
    fetchProductCategory();
    // fetchDealerDetails();
    // fetchCustomerAddress();
    getSliderImages();
    // fetchProducts();
     getNewArrivalProduct();
  }
  void changePage(int index) {
    currentIndexFooter = index;
    notifyListeners();
  }

  Future<void> fetchCurrentLocation() async {
    print("CURRENT LOCATION FETCH");
    try {
      // locationPermission.Location.instance.requestPermission();
      // var currentPos = await Geolocator().getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.high,
      // );
      // var coordinates = Coordinates(currentPos.latitude, currentPos.longitude);
      // var addressName =
      //     await  Geocoder.local.findAddressesFromCoordinates(coordinates);
      // // var featureName = addressName.first.featureName;
      // // var addressLine = addressName.first.addressLine;
      // // var googleAddress = await Geocoder.google(goolePlaceApiKey,language: ).findAddressesFromCoordinates(coordinates);
      // // print("address from google : ${googleAddress.first.featureName} : ${googleAddress.first.addressLine}");
      // _userAddress = LatLng(currentPos.latitude, currentPos.longitude);
      // print("LAt: ${currentPos.latitude} \n Long: ${currentPos.longitude}");
      // notifyListeners();
    } catch (e) {
      print(
          "current location function ERROR??????????????????????????????: $e");
      // _userAddress = LatLng(0, 0);
      notifyListeners();
    }
   
  }
  
  //////////////////////products////////////
  Future<void> addProductDetails() async {
    try {
     var productDetails = Product(
        ram:dropDownRam,
        brandName: dropDownBrand,
        category: dropDownCategory,
        condition: conditionController.text,
        dealerId: userId,
        description:descriptionController.text ,
        productId:'', 
        productName: productNameController.text,
        price: priceController.text,
        imgUrl:'https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png',
        // productAddedOn:Timestamp.now(),
        //type: '',
      );
      return await firebaseService.addProductDetails(
        productDetails,userId);
    } catch (e) {
      print("error while adding supermarket:$addProductDetails");
      return null;
    }
   
  }
  Future<void>updateProductDetails()async{
    try{
      var productDetails=Product(
        productName:productNameController.text,
        brandName: dropDownBrand,
        price:priceController.text,
        description:descriptionController.text,
        condition:dropDownCondition
        );
      print("updateProductName is ");
       return await firebaseService.updateProductDetails(
        productDetails,"kCPrkTDHMRIiCFIkL2Wm");
        
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }
  
  Future<List<Product>> fetchProducts(String dealerId) async {
   
     
    _productDetails= await firebaseService.fetchProducts(dealerId);
    print("product For Approval ${[_productDetails.length]}");
    return _productDetails;

      
  }
  Future<List<Product>> fetchProductByCategory(String categoryName) async {
   
     
    _productDetails= await firebaseService.fetchProductByCategory(categoryName);
    return _productDetails;
      
  }
  Future<List<Product>> getNewArrivalProduct() async {

      
     _productList= await firebaseService.getNewArrivalProduct();
       print("${_productList.length} length of new arrival product product" );
      return _productList;   
  }


  Future<List<Product>> recentlyPurchased() async {

     _recentlyPurchased= await firebaseService.recentlyPurchased();
      print("${_recentlyPurchased.length} length  recently purchased Product" );
      return _recentlyPurchased;   
  }

  Future<List<ProductOrderDetails>> soldProducts() async {

      
     _soldProduct= await firebaseService.soldProducts('CCmTTxEiNfpyRRBpwb4k');
       print("${_soldProduct.length} length  sold product" );
      return _soldProduct;   
  }
  
  
  
  
  /////////////////////fetch ProductCategories////////////////////////
  
//  Future<void> addProductCategories() async {
//     try {
    
//       var productCategoriesDetails = ProductCategories(
//         icon: '',
//         id: '',
//         name: '',
        
//       );
//       return await firebaseService.addProductCategories(
//         producteCategoriesDetails);
//     } catch (e) {
//       print("error while adding supermarket:$addProductDetails");
//       return null;
//     }
    
//   }

  Future<void> fetchProductCategory() async {
    print("fetchProductCategory AppState:");

    _productCategory = await firebaseService.fetchProductCategory();
   notifyListeners();
       
  }


  /////////////////////////Customer/////////////////////////
  
   Future<void>addCustomer()async{
     print("customerId is ${FirebaseAuth.instance.currentUser.uid}");
      List<String> name = [fnameController.text, lnameController.text]; 
   String fullName = name.join(" "); 

    try{
      var customerDetails=Customer(
        currentAddress:currentAddressController.text ,
        // dob: Timestamp.fromDate(DateTime.parse(birthDateController.text)),
        email:emailController.text,
        customerId: FirebaseAuth.instance.currentUser.uid,
        customerName: fullName,
        imgUrl:'',
        mobileNumber: contactNumberController.text,
      );
      print(customerDetails.customerName);
      print("Customer Id is${customerDetails.customerId}");
       return await firebaseService.addCustomer(
        customerDetails,customerDetails.customerId);
      
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }
  
  Future<void> fetchCustomerDetails() async 
  {
     print("fetchCustomer in the appState:");
      _customerDetails= await firebaseService.fetchCustomer(userId);
      notifyListeners();
      print("User Id is $userId");
      print("fetch Customer ${_customerDetails.customerName}  ${_customerDetails.email}");
   
  }

 Future<void>updatecustomerDetail()async{
    try{
      var customerDetails=Customer(
        currentAddress:currentAddressController.text ,
        //dob: ,
        email:emailController.text,
        mobileNumber:contactNumberController.text,
        //name: '',
        //profile:'',
        );
      
       return await firebaseService.updatecustomerDetail(
        customerDetails,userId);
        
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }
   
   
    Future<List<Customer>> fetchCustomerList() async {
    print("fetchProducts AppState:");

      _customerList = await firebaseService.fetchCustomerhistory();
      print("${_customerList.length} _customerList is");
      return _customerList;   
  }

/////////////////////////////////////////////dealer/////////////////////////////////////
Future<void>addDealer()async{
     print("dealerId is ${FirebaseAuth.instance.currentUser.uid}");
      List<String> name = [fnameController.text, lnameController.text]; 
   String fullName = name.join(" "); 

    try{
      var dealerDetails=Dealer(
        currentAddress:currentAddressController.text ,
        // dob: Timestamp.fromDate(DateTime.parse(birthDateController.text)),
        isAdmin:false,
        isDealer:true,
        email:emailController.text,
        dealerId: FirebaseAuth.instance.currentUser.uid,
        dealerName: fullName,
        imgUrl:'',
        contactNumber: contactNumberController.text,
        isApproved: false,
      );
      print(dealerDetails.dealerName);
      print("Dealer Id is${dealerDetails.dealerId}");
       if(isDealer==true){
         return await firebaseService.addDealer(
        dealerDetails,dealerDetails.dealerId);
        }
        else{
          print("you are doing in wrong Way");

        }
      
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }

Future<void>updateDealerDetails()async{
    try{
      var dealerDetails=Dealer(
        currentAddress:currentAddressController.text ,
        //dob: ,
        email:emailController.text,
        contactNumber:contactNumberController.text,
        //name: '',
        //profile:'',
        );
      
       return await firebaseService.updateDealerDetails(
        dealerDetails,userId);
        
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }
Future<void>updateDealerStatus(String dealerId)async{
    try{
      var dealerDetails=Dealer(
isApproved:true
        );
      print("values of iApproved is ${dealerDetails.isApproved}");
       return await firebaseService.updateDealerStatus(
        dealerDetails,dealerId);
        
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }

 Future<List<Dealer>> nonApprovedDealers() async {
    print("fetchProducts AppState:");

      _dealerList = await firebaseService.nonApprovedDealers();
      print("${_dealerList.length} dealerList Lenth");
      return _dealerList;   
  }
//  Future<List<Dealer>> approveDealerProducts() async {
//     print("fetchProducts AppState:");

//       _dealerList = await firebaseService.approveDealerProducts();
//       print("${_dealerList.length} dealerList Lenth");
//       return _dealerList;   
//   }

   Future<void> fetchDealerDetails() async 
  {
     print(" fetch DealerDetails:");
     _dealerDetails= await firebaseService.fetchDealer(userId);
     print("dealer Name ${_dealerDetails.dealerName} ");
     notifyListeners();
      print("User Id dealer $userId");
  //     print("fetch Customer ${_customerDetails.customerName}  ${_customerDetails.email}");
     return _dealerDetails;
  }

  // Future<void> fetchCustomerDetails() async 
  // {
  //    print("fetchCustomer in the appState:");
  //     _customerDetails= await firebaseService.fetchCustomer(userId);
  //     notifyListeners();
  //     print("User Id is $userId");
  //     print("fetch Customer ${_customerDetails.customerName}  ${_customerDetails.email}");
   
  // }


////////////////////////////Addresss///////////////////////////////////////////

// Future<void>addAddress()async{
//     try{
//       var addressDetails=Address(
//         area: 'Mapusa',
//         landMark: 'Pedem Ground',
//       //  location: GeoPoint(
//       //         _position.latitude, _position.longitude),
//         pinCode:'412454' ,
//         type: 'home',

//       );
//        return await firebaseService.addAddress(
//        addressDetails, "${_customerDetails.id}" );
//     }catch(error){
//       print("Error Adding Customer:$error");
//     }
//   }


Future<List<UserAddress>> fetchCustomerAddress() async {
    

   _addressDetails= await firebaseService.fetchCustomerAddress("BYFHkBCOUDPT9Fo9sJSA");
   print("address Details.length ${_addressDetails.length} ");
    return _addressDetails;
  }







////////////////////////////////order///////////////////////////////////////  
Future<String> addOrder(Order order) async {
    try {
    
      var orderDetails = Order(
      dealerId: order.dealerId,
        userName:order.userName,
        userContact: order.userContact,
        productName:order.productName,
        price:order. price,
        imgUrl:order.imgUrl,
        userId: userId,
       email: order.email,
       productId: order.productId,
       orderItems:order.orderItems
        
      );
      print("inAppState addOrder");
      return await firebaseService.addOrders(orderDetails,userId,);
      
    } catch (e) {
     print("Error while ordering product $e");
      // return null;
    }
    
  }

Future<List<Order>> fetchOrder() async {
     print("fetchOrders AppState:");

   _orderList = await firebaseService.fetchOrder(userId);
   print("${_orderList[0].orderItems.length} order list is here");
   notifyListeners();
    return _orderList;
  }


//////////////////////////////////////cart///////////////////////////

Future<void> addToCart(Product productDetails,String productId) async {
    try {
    
      var cartDetails = Cart(
        userId: userId,
        brandName: productDetails.brandName,
        category:productDetails.category,
        condition: productDetails.condition,
        dealerId: productDetails.dealerId,
        dealerName: productDetails.dealerName,
        productId: productId,
        productQty: productDetails.productQty,
        stockAvailable: productDetails.stockAvailable,
        productName: productDetails.productName,
        price: productDetails.price,
        imgUrl:productDetails.imgUrl,
      );
      return await firebaseService.addToCart(cartDetails,userId,productId);
    } catch (e) {
     
      return null;
    }
    
  }
Future<void> fetchCart() async {

    try {
      // userId="ssv8ufhQNRFEuTyuk5JD";
      var response =firebaseService.fetchCart(userId);
     print("fetch cart response ${response.length}");
  response.listen((event){
    _cartDetail= event;
    _limitStockList.clear();
    _cartDetail.forEach((element){

      if(element.stockAvailable < element.productQty || element.stockAvailable ==0){
         _limitedStockWarn=true;
        _limitStockList.add(0);
        notifyListeners();
        }
        else{
         _limitStockList.add(1);
         _limitedStockWarn =false;
         notifyListeners();

      }
    });
    // notifyListeners();
  });
  }catch (error){
    print(error);
  }
}
// Future<void> fetchCart(String customerId) async {
//      print("fetchOrders AppState:");

//    _cartDetail = await firebaseService.fetchCart();
//    print("${_orderList[0].orderItems.length} order list is here");
//    notifyListeners();
//     return _orderList;
//   }

//   int calculateDelivery( int perDeliveryLimit,
//       double deliveryCharges, double exceedDeliveryCharged) {
//     double calc;
//     print("kg in totl: $kgInTotal");
//     print("delivery charges round: ${deliveryCharges.round()}");
//     if (kgInTotal > perDeliveryLimit) {
//       calc = kgInTotal / perDeliveryLimit;
//       var calcmin = calc - 1;
//       return int.parse((calcmin * exceedDeliveryCharged).toStringAsFixed(0)) +
//           int.parse(deliveryCharges.toStringAsFixed(0));
//     }

//     ///if delivery limit exceed charges will be diff but it should not exceed default delivery charg fr final calc
//     return deliveryCharges.round();
//   }
// Map<String, dynamic> cartCalculation(
//       List<int> productPrice,
//       double deliveryCharges,
//       List<int> productQty,
//       // List<double> productWeight,
//       // List<String> weightType,
//       int perDeliveryLimit,
//       double limitExceedCharges) {
//     print("cart calculation");
//     int cartSubTotal = 0;
//     int cartTotalF = 0;
//    int productWithQty = 0;
//     int deliveryTotal = 0;
//     // int productsTotalKg = 0;
//     int loop = productPrice.length;
//     for (var i = 0; i < loop; i++) {
//       productWithQty = productPrice[i] * productQty[i];
//       cartTotalF += productWithQty;
//       cartSubTotal += productWithQty;
//       // productsTotalKg += calculateKg(
//       //   productQty: productQty[i],
//       //   productWeight: productWeight[i],
//       //   weightType: weightType[i],
//       // );
      
//     }

//     deliveryTotal = calculateDelivery(
//          perDeliveryLimit, deliveryCharges, limitExceedCharges);
//     cartSubTotal += deliveryTotal;
//     var cartSubTotalString = cartSubTotal.toString();
//     var cartTotalString = cartTotalF.toString();
//     var cartCalculationOutput = {
//       'subTotal': cartSubTotalString,
//       'total': cartTotalString,
//       'deliveryCharges': deliveryTotal.toString(),
//       'minOrder': cartSubTotal >= 300 ? true : false
//     };
//     return cartCalculationOutput;
//   }


Future<void>updateStock(String productId,String currentQty,bool isAdd)async{

 return await firebaseService.updateStock(userId,"$productId",isAdd,"$currentQty");

}



 

 
 
  //////////////////////////wishlist/////////////////////

Future<List<WishList>> fetchWishlist() async {
     print("fetchWishList AppState:");
     
    return await firebaseService.fetchWishlist("");
    
  }

  
 
  /////////////////////////////////////////sliderss////////////////////////
   Future<void> getSliderImages() async {
   

    _sliderList = await firebaseService.getSliderImages();
     
      
  }
  ////guest
   Future<void>addGuest()async{
  


    try{
      print("guestdetailss");
      var guestDetails =Guest(
        
       // dob: Timestamp.fromDate(DateTime.parse(birthDateController.text)),
      //  DateTime create =DateTime.now(),
       createdOn:Timestamp.fromDate(DateTime.parse(birthDateController.text)),
        // email:emailController.text,
        id: 'id',

        
      );
      
       return await firebaseService.addGuest();
        
    }catch(error){
      print("Error Adding Customer:$error");
    }
  }
  
  // Future<void> fetchGuest() async 
  // {
  //    print("fetchCustomer AppState:");
  //    var user = await firebaseService.fetchGuest();
  //     notifyListeners();
  // }
  

}
