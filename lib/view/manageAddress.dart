import 'package:flutter/material.dart';
import 'package:whynew_new/widget/addressDetail.dart';
import 'package:whynew_new/widget/borderBtn.dart';
import 'package:whynew_new/widget/color.dart';

class ManageAddress extends StatefulWidget {
  ManageAddress({Key key}) : super(key: key);

  @override
  _ManageAddressState createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Address"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: greyColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 0, 15.0),
                child: Text("SAVED ADDRESSES",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
              Addresses(
                address:
                    "1197, Gaunwaddi Anjuna Bardez Goa 403509, near bhumika temple",
                addressType: "Home",
                onDelete: () {},
                onEdit: () {},
              ),
              Addresses(
                address:
                    "1197, Gaunwaddi Anjuna Bardez Goa 403509, near bhumika temple",
                addressType: "Work",
                onDelete: () {},
                onEdit: () {},
              ),
              // Divider(color: Colors.grey[600],height: 1,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: BorderBtn(
                    borderColor: Colors.green,
                    buttonText: "ADD NEW ADDRESS",
                    fullWidthBtn: true,
                    onBtnPress: () {
                      Navigator.pushNamed(context, '/locationAdd');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
