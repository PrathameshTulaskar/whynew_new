import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/model/filter.dart';
import 'package:whynew_new/model/searchBar.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';

// ignore: camel_case_types
class ApproveDealer extends StatefulWidget {
  ApproveDealer({Key key}) : super(key: key);

  @override
  _ApproveDealerState createState() => _ApproveDealerState();
}

// ignore: camel_case_types
class _ApproveDealerState extends State<ApproveDealer> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Approve Dealer")),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SearchButton(),
                        FilterButton()
                      ],
                    ),
                    SizedBox(height: 20),
                    FutureBuilder<List<Dealer>>(
                               future: appState.nonApprovedDealers(),
                               builder: (context, snapshot) {
                  
                   return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
               // print("hellooooooooo:${snapshot.data.length}"),
                children:List<Widget>.generate(appState.dealerList==null ? 0 :appState.dealerList.length,(index){

                    var dealerId= snapshot.data[index].dealerId;
                  return 
                 ApproveRequest(
                   
                         dob: snapshot.data[index].dob.toString(),
                         email:
                         snapshot.data[index].email,
                         contactNumber:
                         snapshot.data[index].contactNumber,
                         name:snapshot.data[index].dealerName, 
                         onPressed: ()
                         {
                          //  setState((){});
                          print("dealer Id for approval : $dealerId");
                          print("update Dealer Approval Status");
                          appState.updateDealerStatus(dealerId);
                         },   
                         );

                }
                              
                               ),
                   );
                   }
                   ),
                  
                    
                             
                  
                     SizedBox(height: 15),
                    //ApproveRequest(),
                  ],
                ),
              ),
            )));
  }
}

class ApproveRequest extends StatelessWidget {
  final String name;
 final String dob;
  final String contactNumber;
  final String email;
  final Function onPressed;

  const ApproveRequest({
    Key key,
    this.contactNumber,
    this.dob,
    this.email,
    this.name,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                side: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //  SizedBox(width: 10,),
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(8.0)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: greyColordark,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0.2, top: 10),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(
                                      "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 17,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          color: Colors.white),
                                      child: Text(this.dob ?? "")),
                                  SizedBox(width: 10),
                                  Icon(Icons.calendar_today_outlined, size: 30)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      this.name ?? "",
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.phone),
                                    Text(this.contactNumber ?? "")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Icon(Icons.mail),
                                    ),
                                    Text(this.email ??"abc@gmail.com"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.home),
                                    Text("Bldg No.7"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          FlatButton(
                              height: 46,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.489,
                              color: Colors.green,
                              child: Text("Approve",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              onPressed:onPressed),
                          FlatButton(
                              height: 46,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.49,
                              color: Colors.red,
                              child: Text("Disapprove",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, ''),
        ),
      ],
    );
  }
}

// // class ApproveRequest extends StatelessWidget {
//   const ApproveRequest({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//                   child: Card(
//     color: greyColordark,
//     shape: RoundedRectangleBorder(

//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(8.0),
//               bottomRight: Radius.circular(8.0)),
//           side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//           //  SizedBox(width: 10,),
//           ClipRRect(
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: greyColordark,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Image.network(
//                   "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
//                   height: 100,
//                   width: 100,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Mr.Sumit Shaha",
//                       style: TextStyle(fontSize: 18, ),
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                  Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Products to be aproved : 80",
//                       style: TextStyle(fontSize: 12, ),
//                     )),

//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(

//                   children: [
//                     Icon(
//                       Icons.location_pin,
//                       color: Theme.of(context).primaryColor,
//                       size: 16,
//                     ),
//                     SizedBox(
//                   width: 5,
//                 ),
//                     Text(
//                       "Khorlim Mapusa Goa",
//                       style: Theme.of(context).textTheme.caption,
//                     ),

//                   ],
//                 ),

//                 SizedBox(height: 10,),
//                 Row(mainAxisAlignment: MainAxisAlignment.end,

//                   children: [
//                     FlatButton(minWidth: 12,
//                     color:Colors.red, child:Text("Decline",style: TextStyle(fontSize: 12,color:Colors.white)),
//                     onPressed:(){}),
//                     SizedBox(
//                   width: 5,
//                 ),
//                 FlatButton(minWidth: 12,
//                     color:Colors.green, child:Text("Accept",style: TextStyle(fontSize: 12,color:Colors.white)),
//                     onPressed:(){}),

//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//       ],
//     ),
//       ),
//       onTap:()=>Navigator.pushNamed(context, ''),
//         ),

//       ],
//     );
//   }
// }
