import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:whynew_new/provider/phone_auth.dart';
import 'package:whynew_new/view/login.dart';
import 'package:whynew_new/view/swipeUpExample.dart';
import 'package:whynew_new/widget/getOtpBtn.dart';

import 'verify.dart';

class AlreadyLogin extends StatefulWidget {
  AlreadyLogin({Key key}) : super(key: key);

  @override
  _AlreadyLoginState createState() => _AlreadyLoginState();
}

class _AlreadyLoginState extends State<AlreadyLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SwipeGestureRecognizer(
        
        onSwipeDown: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginUi()));
        },
              child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/image/facebookBtn.png",
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Image.asset("assets/image/googleBtn.png",
                                width: 100, fit: BoxFit.contain),
                          ],
                        ),
            ),
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Align(
                         alignment: Alignment.topLeft,
                                              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Already Registered?",
                          style: Theme.of(context).textTheme.headline5),
                    Text("Swipe Down",
                          style: Theme.of(context)
                              .textTheme
                              .overline
                              .copyWith(color: Theme.of(context).primaryColor))
                  ],
                ),
              ),
            ),
                      ),
                      
                       SizedBox(height: MediaQuery.of(context).size.height * 0.20),

                      OtpContent(),

                      // Align(
                      //     alignment: Alignment(-1, 0),
                      //     child: Image.asset(
                      //       "assets/image/bottom-leftLogin.png",
                      //       width: 176,
                      //       fit: BoxFit.contain,
                      //     )),
                      // SizedBox(height:50)
                    
                       
                      
                    ],
                  ),
                ),
                // Positioned(top: 0,bottom: 0,child: OtpContent(),),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/image/bottom-leftLogin.png",
                    width: 176,
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/image/top-rightLogin.png",
                      width: 176,
                      fit: BoxFit.contain,
                    )),
                
                   
              ]),
            )),
      ),
    );
  }
}

class OtpContent extends StatelessWidget {
  final scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "scaffold-get-phone");
  OtpContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone Number",
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: Colors.grey[700]),
              )),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-0.0, 3.0),
                      blurRadius: 2,
                      spreadRadius: 0.01,
                      color: Colors.grey),
                ]),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: Provider.of<PhoneAuthDataProvider>(context, listen: false)
                          .phoneNumberController,
                        decoration: InputDecoration(
                            hintText: "Enter Your 10 Digit Phone Number",
                            border: InputBorder.none),
                      ),
                    )),
                Icon(
                  Icons.call,
                  color: Theme.of(context).primaryColor,
                )
              ],
            )),
        SizedBox(
          height: 25,
        ),
        GetOtpBtn(
          onClick: () => startPhoneAuth(context),
          title: "GET OTP",
        ),
        SizedBox(
          height: 35,
        ),
        Image.asset(
          "assets/image/hellologin.png",
          width: 120,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  startPhoneAuth(context) async {
    final phoneAuthDataProvider =
        Provider.of<PhoneAuthDataProvider>(context, listen: false);
    phoneAuthDataProvider.loading = true;
    // var countryProvider = Provider.of<CountryProvider>(context, listen: false);
    bool validPhone = await phoneAuthDataProvider.instantiate(
        dialCode: "+91",
        onCodeSent: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => PhoneAuthVerify()));
        },
        onFailed: () {
          _showSnackBar(phoneAuthDataProvider.message);
        },
        onError: () {
          _showSnackBar(phoneAuthDataProvider.message);
        });
    if (!validPhone) {
      phoneAuthDataProvider.loading = false;
      _showSnackBar("Oops! Number seems invaild");
      return;
    }
  }

  _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('$text'),
    );
//    if (mounted) Scaffold.of(context).showSnackBar(snackBar);
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
