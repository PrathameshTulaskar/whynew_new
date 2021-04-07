import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/provider/appstate.dart';

import 'package:whynew_new/widget/categoryTile.dart';
import 'package:whynew_new/widget/color.dart';


// ignore: camel_case_types
class ApproveDealerProducts extends StatefulWidget {
  ApproveDealerProducts({Key key}) : super(key: key);

  @override
  _ApproveDealerProductsState createState() => _ApproveDealerProductsState();
}
// var dealerId;
// ignore: camel_case_types
class _ApproveDealerProductsState extends State<ApproveDealerProducts> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    String dealerId = ModalRoute.of(context).settings.arguments;
    print("dealerid on approveDealerProducs $dealerId");
 
        return SafeArea(
            child: Scaffold(
              appBar:AppBar(title:Text("Products")),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                
                children: 
    //             List<Widget>.generate(appState.productDetails.length,(index)
               
    //             {
    //               //  dealerId = appState.productDetails[index].dealerId;
    //               return  Column(children: [
    //     ApproveProductRequest(
    //                                    name:appState.productDetails[index].productName, 
    //                                    price:appState.productDetails[index].price,
    //                                    //category:snapshot.data[index].category,
    //                                    imgUrl:appState.productDetails[index].imgUrl,
    //                                    category:appState.productDetails[index].category
    //                                   //  address:snapshot.data[index].address,
    //                                      )
    //    // Text(appState.productCategory[index].name)
    //               ]
    // ,);
    //             }   ),
              //  [  
                 
                 
                 
                 
                 
                 
                 
                 
                 
              //    FutureBuilder<List<Product>>(
              //                  future:appState.fetchProducts(dealerId),
              //                  builder:(context, snapshot){
                              
              //                     var children = <Widget>[];
              //                     switch (snapshot.connectionState) {
              //             case ConnectionState.none:
              //             case ConnectionState.waiting:
              //               children = [
              //                 Container(
              //                  width: MediaQuery.of(context).size.width,
              //                  height: MediaQuery.of(context).size.height,
              //                  child: Center(child: CircularProgressIndicator()))
              //               ];
              //               break;
              //             default:
              //               if (snapshot.hasError)
              //                 children = [Text('Error: ${snapshot.error}')];
              //               else {
              //                 snapshot.data.length== 0
              //                  ? children = null
              //                  :snapshot.data.forEach((element) {
                                 
                               
              //                      children.add(ApproveProductRequest(
              //                       // product:element,
              //                      name:element.productName,
              //                      category: element.category,
              //                      imgUrl:element.imgUrl,
              //                      price:element.price,
              //                     //  onPressed:()=>Navigator.pushNamed(context, '/editProductList',
              //                     //  arguments:Product(productName:element.productName,imgUrl:element.imgUrl,price:element.price,description:element.description,category:element.category,condition:element.condition,brandName:element.brandName),
              //                     //  ),

                                     
              //                         )
                                      

                                     
              //                      );
              //                      print("hello");
              //                      print("Image url is ${element.imgUrl}");
              //                    });
              //                 //data
              //               }
              //           }
                          
              //           print(
              //               "::::::::::::::::::::::::::::::::::::::::::::::::::::::");
              //           return children == null ?  Container(
              //             height: MediaQuery.of(context).size.height * 0.50,
                        
                         
              //           ):
                      
              //           GridView.count(

              //                crossAxisCount: 2,
              //                crossAxisSpacing:10,
              //                mainAxisSpacing: 2,
              //                childAspectRatio: 0.90,
              //                physics: NeverScrollableScrollPhysics(),
              //                shrinkWrap: true,
              //                children: children,
              //                 );
                       
              //         },

                
                                                
              //               ),
              //               ]
                [
                  
                FutureBuilder<List<Product>>(
                                 future: appState.fetchProducts(dealerId),
                                 builder: (context, snapshot) {
                    
                  
                   return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
               // print("hellooooooooo:${snapshot.data.length}"),
                children:List<Widget>.generate(appState.dealerList.length,(int index)
                {
                  
                  return 
              ApproveProductRequest(
                                       name:snapshot.data[index].productName, 
                                       price:snapshot.data[index].price,
                                       category:snapshot.data[index].category,
                                       imgUrl:snapshot.data[index].imgUrl
                                      //  address:snapshot.data[index].address,
                                         );

                }
                          
                           ),
              );
                      
                                 },
                               ),
              
                  SizedBox(height:20),
            //    ApproveProductRequest(),
            //    ApproveProductRequest(),   
            //   ApproveProductRequest(),  
            //   ApproveProductRequest(),
            //  Visibility(child: ApproveProductRequest(),visible:appState.isApprove,replacement: Text("hello"),),
            //       Visibility(child: ApproveProductRequest(),visible:appState.isApprove,replacement: Text("hello"),),
            ],
        ),
      ),
    ))
    );
  }
}

class ApproveProductRequest extends StatelessWidget {
  final String name;
  final String price;
  final String imgUrl;final String category;
  final Product productDetails;
  const ApproveProductRequest({
    Key key,this.name,this.price,this.imgUrl,this.category,this.productDetails,
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
              child: Image.network(this.imgUrl ??
                "",
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
                  child: Text( this.name ??
                    "New Inspiron 5590 Laptop",
                    style: TextStyle(fontSize: 16, ),
                  )),
              SizedBox(
                height: 10,
              ),
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Price:${this.price}/-"   
                   ??
                    "Price:/-",
                    style: TextStyle(fontSize: 12, ),
                  )),
              
              SizedBox(
                height: 10,
              ),
              
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.category ??
                    "Category: Notebook  Laptop ",
                    style: TextStyle(fontSize: 12, ),
                  )),

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
        // Icon(Icons.arrow_forward_ios),
        Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(icon:Icon(Icons.arrow_forward_ios),
          onPressed:(){Navigator.pushNamed(context, '/productNameAdmin',
          arguments:Product()
         
          );
          // arguments:dealerId;
          }
          ),
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


