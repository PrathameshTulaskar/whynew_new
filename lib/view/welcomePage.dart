import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/getOtpBtn.dart';

class WelcomePage extends StatefulWidget {
  final Credentials userData;
  WelcomePage({Key key, this.userData}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
      final appState = Provider.of<Appstate>(context);
    return SafeArea(
      child: Scaffold(
      
          body: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.99,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                //      CircleAvatar(
                //         radius: 80,
                //         backgroundColor:Colors.grey[200],
                //                         child: Icon(
                //   Icons.person,
                //   color: Theme.of(context).primaryColor,
                //   size: 70,
                // ),
                //      ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                Container(
                child:Image.asset(
                "assets/image/whynew_logo.png",
                width: 150,
                fit: BoxFit.contain,
              ),
              ),
                
                   SizedBox(width:MediaQuery.of(context).size.width*0.99),
//                  Positioned(
//             bottom: -100,
//             right: 0,
//             child: Container(
//               color:Colors.white,
//               child: GetOtpBtn(title:"Login",
// onClick:(){}),
//             )
//           ),
                   
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: 0,
              child: Image.asset(
                "assets/image/welcome_img.png",
                width: 500,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 4,
              left: 0,
              child: Image.asset(
                "assets/image/top-left.png",
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 180,
              right: 4,
              child: GetOtpBtn(
                 svgImg:true,
                svgPath:"assets/svg/customer.svg",
                title:"Customer",
onClick:()=>{Navigator.pushNamed(context,'/login'),
setState((){appState.isDealer=true;
appState.isAdmin=false;
 appState.isClient=false;})

})
            ),
            Positioned(
              bottom: 120,
              right: 4,
              child: GetOtpBtn(
                svgImg:true,
                svgPath:"assets/svg/customer.svg",
                title:"Dealer",
onClick:()=>{Navigator.pushNamed(context,'/login'),
setState((){appState.isDealer=false;
appState.isAdmin=false;
 appState.isClient=true;})})

),
  
            Positioned(
              bottom: 40,
              left: 4,
              child: GetOtpBtn(
                
                svgImg:true,
                svgPath:"assets/svg/shopnow.svg",
                title:"Shop Now",
                onClick:(){})
            ),

            // Align(
            //     alignment: Alignment.topRight,
            //     child: Image.asset(
            //       "assets/image/top-rightLogin.png",
            //       width: 178,
            //       fit: BoxFit.contain,
            //     )
            // ),
          ])),
    );
  }
}
