import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/filter.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';


// ignore: camel_case_types
class ByProduct extends StatefulWidget {
  ByProduct({Key key}) : super(key: key);

  @override
  _ByProductState createState() => _ByProductState();
}

// ignore: camel_case_types
class _ByProductState extends State<ByProduct> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
  return SafeArea(
        child: Scaffold(
          appBar:AppBar(title:Text("Sold Products")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
             TabBar(),
              SizedBox(height:20),
              Column(children:
              // List<Widget>.generate(appState.orderList.length==null ? 0 :appState.orderList.length,(indexOut){


              //     return Column(children:
              //      List<Widget>.generate(appState.orderList[indexOut].orderItems.length,(index){
              //        return   ApproveProductRequest(
              //         name: appState.orderList[indexOut].orderItems[index].productName,
              //         imgUrl: appState.orderList[indexOut].orderItems[index].productImg ,
              //         price:  appState.orderList[indexOut].orderItems[index].productTotal
              //     );
                     
                     
              // //        OrderTile(
              // //   amount: appState.orderList[indexOut].orderItems[index].productTotal,
              // //   orderStatus: 2,
              // //   productTitle:appState.orderList[indexOut].orderItems[index].productName,
              // //   productUrl:appState.orderList[indexOut].orderItems[index].productImg ,
              // //   time: "10:30am",
              // // );
               
              //      }));
                    
              //   }
                              
              //                  )),
              List<Widget>.generate(appState.soldProduct.length,(index)
                {
                  return  ApproveProductRequest(
                      name: appState.soldProduct[index].productName,
                      imgUrl: appState.soldProduct[index].imgUrl,
                      price: appState.soldProduct[index].price
                  );

                }   ),
              ),
              //ApproveProductRequest(),
              //SizedBox(height:20),
              //ApproveProductRequest(),
            ],
        ),
      ),
    ))
    );
  }
}

class ApproveProductRequest extends StatelessWidget {
  final String price;
  final String imgUrl;
  final String name;
  
  const ApproveProductRequest({
    Key key,
    this.price,
    this.imgUrl,
    this.name,
  }) : super(key: key);

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
    child: Column(
      children: [
        Row(
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
                  child: Image.network(this.imgUrl ??
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
                        "New Inspiron 5590 Laptop",
                        style: TextStyle(fontSize: 16, ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                   Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Price:${this.price}/-" ??
                        "Price:40,000/-",
                        style: TextStyle(fontSize: 12, ),
                      )),
                  
                  SizedBox(
                    height: 10,
                  ),
                  
                   Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "sold: 50 ",
                        style: TextStyle(fontSize: 12, ),
                      )),

                  SizedBox(height: 15,),
                  
                  
                
                ],
              ),
              
            ),
            // Icon(Icons.arrow_forward_ios),
            Padding(
              padding: const EdgeInsets.all(0),
              child: IconButton(icon:Icon(Icons.arrow_forward_ios),
              onPressed:()=>Navigator.pushNamed(context, '/byProductDetails')),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Available stock:1234"),
               FlatButton(
                                    height: 40,
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.40,
                                    color: Colors.red,
                                    child: Text("Pause",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                    onPressed: () {}),
                                    
             ],
           ),
         ),
      ],
    ),
      ),
        
         
          
        
      ],
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.98,
      decoration: BoxDecoration(color: Colors.white,border: Border.all(),),
      
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
        Text("Sales",style:TextStyle(fontSize: 18,),),
        FilterButton(),
      ],),
    );
  }
}