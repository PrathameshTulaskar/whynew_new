import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/filter.dart';
import 'package:whynew_new/model/searchBar.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';

// ignore: camel_case_types
class ClientDealerHistory extends StatefulWidget {
  ClientDealerHistory({Key key}) : super(key: key);

  @override
  _ClientDealerHistoryState createState() => _ClientDealerHistoryState();
}

// ignore: camel_case_types
class _ClientDealerHistoryState extends State<ClientDealerHistory> {
  bool dealerNameCard=true;
  bool customerNameCard=false;
  @override
  Widget build(BuildContext context) {
      final appState = Provider.of<Appstate>(context);
  
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor:Theme.of(context).primaryColor.withOpacity(0.8),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                  text: "Dealer's",
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: "Client's",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
                 Column(
                    children: List<Widget>.generate(appState.dealerList.length,(index)
               
                {
                  return  Column(children: [
       DealersNameCard(
         name:appState.dealerList[index].dealerName,
         imgUrl:appState.dealerList[index].imgUrl
       ),
       // Text(appState.productCategory[index].name)
                  ]
    ,);

                }   ),
                  ),
                   Column(
                    children: List<Widget>.generate(appState.customerList.length,(index)
               
                {
                  return  Column(children: [
       CustomerNameCard(
         name:appState.customerList[index].customerName,
         imgUrl:appState.customerList[index].imgUrl
       ),
       // Text(appState.productCategory[index].name)
                  ]
    ,);

                }   ),
                  ),
              
                 
               
               
            ],
          )),
    ));
  }
}

class DealersNameCard extends StatelessWidget {
  final String name;
  final String imgUrl;
  
  const DealersNameCard({Key key,
  this.name,
  this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
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
          child:  Padding(
            padding: const EdgeInsets.only(left:6.0,right:8.0,top:2,bottom:2),
            child: Container(height:90,
                      width:90,
 
  decoration: BoxDecoration(border: Border.all(color: Colors.black),
	shape: BoxShape.circle,
	image: DecorationImage(
	  image: NetworkImage(imgUrl ??""),
	  fit: BoxFit.fill
	),
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
              SizedBox(
          height: 10,
        ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name ?? "Dealer Name",
                    style: TextStyle(fontSize: 16, ),
                  )),
              SizedBox(
                height: 10,
              ),
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Purchased:12",
                    style: TextStyle(fontSize: 12, ),
                  )),
              
              SizedBox(
                height: 10,
              ),
              
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Sold: 1 ",
                    style: TextStyle(fontSize: 12, ),
                  )),

              SizedBox(height: 10,),
              
              
            ],
          ),
          
        ),
        
        Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(icon:Icon(Icons.arrow_forward_ios),
          onPressed:(){}),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
      ),
        
         
          
        
      ],
    );
  }
}


class CustomerNameCard extends StatelessWidget {
  final String name;
  final String imgUrl;
  const CustomerNameCard({Key key,this.name,this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
    color: greyColordark,
    shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(8.0)),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //  SizedBox(width: 10,),
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
          child:  Padding(
            padding: const EdgeInsets.only(left:6.0,right:8.0,top:2,bottom:2),
            child: Container(height:90,
                      width:90,
 
  decoration: BoxDecoration(border: Border.all(color: Colors.black),
	shape: BoxShape.circle,
	image: DecorationImage(
	  image: NetworkImage(imgUrl ?? ""),
	  fit: BoxFit.fill
	),
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
              SizedBox(
          height: 10,
        ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                   name ?? "",
                    style: TextStyle(fontSize: 16, ),
                  )),
              SizedBox(
                height: 10,
              ),
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Purchased:12",
                    style: TextStyle(fontSize: 12, ),
                  )),
              
              SizedBox(
                height: 20,
              ),
              
               
              
              
            ],
          ),
          
        ),
        
        Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(icon:Icon(Icons.arrow_forward_ios),
          onPressed:()=> Navigator.pushNamed(context, '/customerProductHistory'),),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
      ),
        
         
          
        
      ],
    );
  }
}
