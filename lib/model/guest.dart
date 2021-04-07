import 'package:cloud_firestore/cloud_firestore.dart';

class Guest {
  String id;

  Timestamp createdOn;
 

  Guest(
      {this.id,
     
      this.createdOn,
      
      });
  Guest.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],

        this.createdOn = json['createdOn'];


  Guest.fromSnapshot(DocumentSnapshot snapshot)
      : this.id = snapshot.id,
        //this.supermarketLocation,
        this.createdOn=snapshot.data()['createdOn'];

}
