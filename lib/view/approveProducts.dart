import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/provider/appstate.dart';

import 'package:whynew_new/widget/categoryTile.dart';
import 'package:whynew_new/widget/color.dart';


// ignore: camel_case_types
class ApproveProducts extends StatefulWidget {
  ApproveProducts({Key key}) : super(key: key);

  @override
  _ApproveProductsState createState() => _ApproveProductsState();
}
var dealerId;
// ignore: camel_case_types
class _ApproveProductsState extends State<ApproveProducts> {
  @override
  Widget build(BuildContext context) {
     final appState = Provider.of<Appstate>(context);
    return SafeArea(
        child: Scaffold(
          appBar:AppBar(title:Text("Approve Products")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
              SizedBox(height:20),
              Text("Pending Approved : 80"),
              // SizedBox(height:20),
              // ApproveRequest(),
              // ApproveRequest(),
              FutureBuilder<List<Dealer>>(
                               future: appState.nonApprovedDealers(),
                               builder: (context, snapshot) {
                  
                   return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
              //  print("hellooooooooo:${snapshot.data.length}");
                children:List<Widget>.generate(appState.dealerList==null ? 0 :appState.dealerList.length,(index){

                      dealerId=appState.dealerList[index].dealerId;
                      print("dealerId isin approveProducts $dealerId");
                  return 
                 ApproveRequest(
                        
                     
                         name:appState.dealerList[index].dealerName, 
                        imgUrl:appState.dealerList[index].imgUrl,
                        onPressed:(){Navigator.pushNamed(context, '/approveDealerProducts',
                                arguments:dealerId);
                                 print("dealerIddealerIddealerIddealerIddealerIddealerIddealerId  $dealerId");
      }
                         );

                }
                              
                               ),
                   );
                   }
                   ),
              // Expanded(
              //                       child: FutureBuilder<List<Dealer>>(
              //                    future: appState.fetchDealerList(),
              //                    builder: (context, snapshot) {
                    
                  
              //      return Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   // crossAxisAlignment: CrossAxisAlignment.start,
              //  // print("hellooooooooo:${snapshot.data.length}"),
              //   children:List<Widget>.generate(appState.dealerList.length,(int index)
              //   {
              //     return ApproveRequest(
              //                          name:snapshot.data[index].name, 
              //                         //  address:snapshot.data[index].address,
              //                            );

              //   }
                          
              //              ),
              // );
                      
              //                    },
              //                  ),
              //   ),
            ],
        ),
      ),
    ))
    );
  }
}

class ApproveRequest extends StatelessWidget {
   final String name;
  final String address;
  final String imgUrl;
  final Function onPressed;
  ApproveRequest({

    Key key,
    this.imgUrl,
 this.address,
 this.onPressed,
 this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
                  child: Card(
    color: greyColordark,
    shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0)),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          //  SizedBox(width: 10,),
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
            child: Container(
              decoration: BoxDecoration(
                color: greyColordark,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.network( this.imgUrl ??
                  "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.name ??
                      "Mr.Sumit Shaha",
                      style: TextStyle(fontSize: 18, ),
                    )),
                SizedBox(
                  height: 10,
                ),
                 Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Products to be aproved :${appState.productDetails.length}",
                      style: TextStyle(fontSize: 12, ),
                    )),
                
                SizedBox(
                  height: 10,
                ),
                Row(
                 
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    SizedBox(
                  width: 5,
                ),
                    Text( this.address ??
                      "Khorlim Mapusa Goa",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    
                  ],
                ),

                SizedBox(height: 10,),
                // Row(mainAxisAlignment: MainAxisAlignment.end,
                 
                //   children: [
                //     FlatButton(minWidth: 12,
                //     color:Colors.red, child:Text("Decline",style: TextStyle(fontSize: 12,color:Colors.white)),
                //     onPressed:(){}),
                //     SizedBox(
                //   width: 5,
                // ),
                // FlatButton(minWidth: 12,
                //     color:Colors.green, child:Text("Accept",style: TextStyle(fontSize: 12,color:Colors.white)),
                //     onPressed:(){}),
                    
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
      ],
    ),
      ),
      onTap:onPressed,
      // onTap:(){Navigator.pushNamed(context, '/approveDealerProducts',
      // arguments:dealerId);
      // print("dealerIddealerIddealerIddealerIddealerIddealerIddealerId  $dealerId");
      // }
        ),
        
         
          
        
      ],
    );
  }
}


