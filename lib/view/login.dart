import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:whynew_new/provider/phone_auth.dart';
import 'package:whynew_new/view/alreadyLogin.dart';
import 'package:whynew_new/view/swipeUpExample.dart';

import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/provider/phone_auth.dart';
import 'package:whynew_new/view/addRegistrationDetail.dart';

import 'package:whynew_new/widget/getOtpBtn.dart';

import 'verify.dart';

class LoginUi extends StatefulWidget {
  LoginUi({Key key}) : super(key: key);

  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  // final fbLogin = FacebookLogin();
  final GoogleSignIn googleAuth = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SwipeGestureRecognizer(
        
        onSwipeUp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AlreadyLogin()));
        },
              child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("New User",
                        style: Theme.of(context).textTheme.headline5),
                    Text("Swipe Up",
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(color: Theme.of(context).primaryColor))

                    

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
                      alignment: Alignment.topRight,
                      child: Image.asset(
                      "assets/image/top-rightLogin.png",
                      width: 176,
                      fit: BoxFit.contain,
                  ),
                    ),
                     
                      SizedBox(height: MediaQuery.of(context).size.height * 0.25),

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

              
              Positioned(
                top: 15,
                left:0,right:0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // InkWell(
                      //   onTap: () {
                      //     fbLogin.logIn([
                      //       'email',
                      //       'public_profile',
                      //     ]).then((result) {
                      //       switch (result.status) {
                      //         case FacebookLoginStatus.loggedIn:
                      //           FacebookAccessToken facebookAccessToken =
                      //               result.accessToken;
                      //           OAuthCredential authCredential =
                      //               FacebookAuthProvider.credential(
                      //                   facebookAccessToken.token);

                      //           FirebaseAuth.instance
                      //               .signInWithCredential(authCredential)
                      //               .then((signedInUser) {
                      //             print(
                      //                 'Signed in as ${signedInUser.additionalUserInfo.profile}');

                      //             Navigator.pushAndRemoveUntil(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       new AddRegistrationDetail(
                      //                         userData: Credentials(
                      //                           profileUrl: signedInUser
                      //                               .user.photoURL,
                      //                           userId: signedInUser.user.uid,
                      //                           emailAddress:
                      //                               signedInUser.user.email,
                      //                         ),
                      //                       )),
                      //               (Route<dynamic> route) => false,
                      //             );
                      //           }).catchError((e) {
                      //             print("fb login error : $e");
                      //           });
                      //           break;
                      //         case FacebookLoginStatus.cancelledByUser:
                      //           print('Cancelled by you');
                      //           break;
                      //         case FacebookLoginStatus.error:
                      //           print('Error');
                      //           print(result.errorMessage);
                      //           break;
                      //       }
                      //     }).catchError((e) {
                      //       print(e);
                      //     });
                      //   },
                      //   child: Image.asset(
                      //     "assets/image/facebookBtn.png",
                      //     width: 100,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          print("tap");
                          googleAuth.signIn().then((result) {
                            //_handleGetContact(result);
                            result.authentication.then((googleKey) {
                              final OAuthCredential credential =
                                  GoogleAuthProvider.credential(
                                accessToken: googleKey.accessToken,
                                idToken: googleKey.idToken,
                              );

                              FirebaseAuth.instance
                                  .signInWithCredential(credential)
                                  .then((signedInUser) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          new AddRegistrationDetail(
                                            userData: Credentials(
                                              profileUrl:
                                                  signedInUser.user.photoURL,
                                              userId: signedInUser.user.uid,
                                              emailAddress:
                                                  signedInUser.user.email,
                                            ),
                                          )),
                                  (Route<dynamic> route) => false,
                                );
                              }).catchError((e) {
                                print("Google login error : $e");
                              });
                            }).catchError((e) {
                              print(e);
                            });
                          }).catchError((e) {
                            print(e);
                          });
                        },
                        child: Image.asset("assets/image/googleBtn.png",
                            width: 100, fit: BoxFit.contain),
                      ),
                    ],
                  ),
              ),
            ]),
          )),

    ));
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
                        controller: Provider.of<PhoneAuthDataProvider>(context,
                                listen: false)
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
