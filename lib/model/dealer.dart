import 'package:cloud_firestore/cloud_firestore.dart';

class Dealer {
  String dealerId;
  String dealerName;
  Timestamp dob;
  String currentAddress;
  String imgUrl;
  String email;
  String contactNumber;
  bool isApproved;
  bool isAdmin;
  bool isDealer;

  Dealer(
      {this.dealerId,
      this.imgUrl,
      this.currentAddress,
      this.dealerName,
      this.dob,
      this.contactNumber,
      this.email,
      this.isAdmin,
      this.isDealer,
      this.isApproved});
  Dealer.fromJson(Map<String, dynamic> json)
      : this.dealerId = json['dealerId'],
        //this.supermarketLocation =json['location']['geopoint'],
        this.dealerName = json['dealerName'],
        this.currentAddress = json['currentAddress'],
        this.imgUrl = json['imgUrl'],
        this.dob = json['dob'],
        this.contactNumber = json['contactNumber'],
        this.email = json['email'],
        this.isAdmin = json['isAdmin'],
        this.isDealer = json['isDealer'],
        this.isApproved = json['isApproved'];

  Dealer.fromSnapshot(DocumentSnapshot snapshot)
      : this.dealerId = snapshot.id,
         this.dealerName = snapshot.data()['dealerName'],
        this.imgUrl = snapshot.data()['imgUrl'],
        this.currentAddress = snapshot.data()['currentAddress'],
        //this.supermarketLocation,
        this.dob=snapshot.data()['dob'],
        this.contactNumber = snapshot.data()['contactNumber'],
        this.isApproved = snapshot.data()['isApproved'],
        this.isAdmin = snapshot.data()['isAdmin'],
        this.isDealer = snapshot.data()['isDealer'],
        this.email = snapshot.data()['email'];
}
