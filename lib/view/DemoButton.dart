import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/view/addRegistrationDetail.dart';
import 'package:whynew_new/widget/backButton.dart';


class DemoButton extends StatefulWidget {
  DemoButton({Key key}) : super(key: key);

  @override
  DemoButtonState createState() => DemoButtonState();
}

class DemoButtonState extends State<DemoButton> {
  @override
  Widget build(BuildContext context) {
    CategoryPageArgs args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
                child: Text("Email"),
                onPressed:(){
                    Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new AddRegistrationDetail(
                                              userData: Credentials(
                                                profileUrl: "signedInUser .user.photoURL",
                                                contactNumber: "8805202434",
                                                //userId: signedInUser.user.uid,
                                                emailAddress:"prathameshtulaskar",
                                              ),
                                            )),
                                    (Route<dynamic> route) => false,
                                  );
                }
            ),
            // FlatButton(
            //     child: Text("Contact Number"),
            //     onPressed:(){}
            // ),
      
          ],
        ),
      ),
    ));
  }
}