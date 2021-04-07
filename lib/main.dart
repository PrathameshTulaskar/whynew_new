import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/phone_auth.dart';
import 'package:whynew_new/view/addRegistrationDetail.dart';
import 'package:whynew_new/view/approveDealer.dart';
import 'package:whynew_new/view/approveDealerProdcts.dart';
import 'package:whynew_new/view/approveProducts.dart';
import 'package:whynew_new/view/byProduct.dart';
import 'package:whynew_new/view/byProductDetails.dart';
import 'package:whynew_new/view/cart.dart';
import 'package:whynew_new/view/clientDealerHistory.dart';
import 'package:whynew_new/view/customerProductHistory.dart';
import 'package:whynew_new/view/customerOrderStatus.dart';
import 'package:whynew_new/view/customerProductSingleCategory.dart';
import 'package:whynew_new/view/dealerList.dart';
import 'package:whynew_new/view/dealerProductList.dart';
import 'package:whynew_new/view/dealersPurchasedList.dart';
import 'package:whynew_new/view/editProductList.dart';
import 'package:whynew_new/view/homePage.dart';
import 'package:whynew_new/view/locationAdd.dart';
import 'package:whynew_new/view/login.dart';
import 'package:whynew_new/view/welcomePage.dart';
import 'package:whynew_new/view/manageAddress.dart';
import 'package:whynew_new/view/manageCustomersOrders.dart';
import 'package:whynew_new/view/manageOrders.dart';
import 'package:whynew_new/view/navigationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whynew_new/view/productStatus.dart';
import 'package:whynew_new/view/SalesReport.dart';
import 'package:whynew_new/view/productAddConfirmation.dart';

import 'package:whynew_new/view/singleOrderDetail.dart';
import 'package:whynew_new/view/singleProduct.dart';
import 'package:whynew_new/view/swipeUpExample.dart';
import 'provider/appstate.dart';
import 'view/DemoButton.dart';
import 'view/checkout.dart';
import 'view/myOrders.dart';
import 'view/newArrivalProducts.dart';
import 'view/productNameAdmin.dart';
import 'view/singleCategory.dart';
import 'view/allProduct.dart';
import 'view/addSingleItem.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Whynew());
}

class Whynew extends StatelessWidget {
  const Whynew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Appstate(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneAuthDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Whynew",
        //  home: WelcomePage(),
        //home: LandingPage(),
        //  home: NavigationPage(),
         home: LandingPage(),
        // home:DealerProfile(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => NavigationPage(),
          '/SingleCategory': (BuildContext context) => SingleCategory(),
          '/SingleProduct': (BuildContext context) => SingleProduct(),
          '/cart': (BuildContext context) => CartPage(),
          '/checkout': (BuildContext context) => CheckoutPage(),
          '/myOrders': (BuildContext context) => MyOrders(),
          '/singleOrderDetail': (BuildContext context) => SingleOrderDetail(),
          '/editProductList': (BuildContext context) => EditProductList(),
          '/manageAddress': (BuildContext context) => ManageAddress(),
          '/login': (BuildContext context) => LoginUi(),
          '/allProduct': (BuildContext context) => AllProduct(),
          '/singleItem': (BuildContext context) => SingleItem(),
          '/productStatus': (BuildContext context) => ProductStatus(),
          '/salesReport': (BuildContext context) => SalesReport(),
          '/delerProductList': (BuildContext context) => DealerProductList(),
          '/productAddConfirmation': (BuildContext context) => ProductAddConfirmation(),
          '/approveDealer': (BuildContext context) => ApproveDealer(),
          '/approveDealerProducts': (BuildContext context) =>
              ApproveDealerProducts(),
          '/productNameAdmin': (BuildContext context) => ProductNameAdmin(),
          '/byProduct': (BuildContext context) => ByProduct(),
          '/byProductDetails': (BuildContext context) => ByProductDetails(),
          '/dealersPurchasedList': (BuildContext context) =>
              DealerPurchasedList(),
          '/approveProducts': (BuildContext context) => ApproveProducts(),
          '/clientDealerHistory': (BuildContext context) =>
              ClientDealerHistory(),
          '/customerProductHistory': (BuildContext context) =>
              CustomerProductHistory(),
          '/customerProductSingleCategory': (BuildContext context) =>
              CustomerProductSingleCategory(),
          '/manageOrders': (BuildContext context) => ManageOrders(),
          '/manageCustomersOrders': (BuildContext context) =>
              ManageCustomersOrders(),
          '/customerOrderStatus': (BuildContext context) =>
              CustomerOrderStatus(),
          '/locationAdd': (BuildContext context) => LocationAdd(),
          '/getNewArrivalProduct': (BuildContext context) => GetNewArrivalProduct(),
          // '/navigationPage': (BuildContext context) => NavigationPage(),
        },
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.white,
                actionsIconTheme: IconThemeData(
                  color: Color(int.parse("0xff271B73")),
                  size: 18,
                ),
                iconTheme: IconThemeData(
                  color: Color(int.parse("0xff271B73")),
                ),
                textTheme: TextTheme(
                    headline6: TextStyle(
                        color: Color(int.parse("0xff271B73")),
                        fontSize: 18,
                        fontWeight: FontWeight.w600))),
            primaryColor: Color(int.parse("0xff271B73")),
            textTheme: TextTheme(
              headline1: GoogleFonts.roboto(
                  fontSize: 96,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.5),
              headline2: GoogleFonts.roboto(
                  fontSize: 60,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.5),
              headline3:
                  GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
              headline4: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.25),
              headline5:
                  GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
              headline6: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15),
              subtitle1: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              subtitle2: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1),
              bodyText1: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
              bodyText2: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              button: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.25),
              caption: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                  color: Colors.black),
              overline: GoogleFonts.roboto(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            )),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // FirebaseAuth.instance.signOut();
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return WelcomePage();
          }
          return NavigationPage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
