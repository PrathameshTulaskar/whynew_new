import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/provider/appstate.dart';

import 'package:whynew_new/view/profile.dart';
import 'package:whynew_new/view/singleCategory.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/pageLabel.dart';
import 'package:whynew_new/widget/productWidget.dart';

class DealerProductList extends StatefulWidget {
  DealerProductList({Key key}) : super(key: key);

  @override
  _DealerProductListState createState() => _DealerProductListState();
}

class _DealerProductListState extends State<DealerProductList> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
       String args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonCustom(),
            ProfileName(
              name:appState.dealerDetails.dealerName
              // imgUrl:appState.dealer.imgUrl,

            ),
            SizedBox(height: 20),
            FutureBuilder<List<Product>>(
                               future:appState.fetchProducts(args),
                               builder:(context, snapshot){
                              
                                  var children = <Widget>[];
                                  switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            children = [
                              Container(
                               width: MediaQuery.of(context).size.width,
                               height: MediaQuery.of(context).size.height,
                               child: Center(child: CircularProgressIndicator()))
                            ];
                            break;
                          default:
                            if (snapshot.hasError)
                              children = [Text('Error: ${snapshot.error}')];
                            else {
                              snapshot.data.length== 0
                               ? children = null
                               :snapshot.data.forEach((element) {
                                 var dealerId= element.dealerId;
                               //appState.getOurFishProduct().forEach((element) {
                                   children.add(ProductBox(
                                     product:element,
                                   name:element.productName,
                                   imgUrl:element.imgUrl,
                                   price:element.price,
                                   onPressed:()=>Navigator.pushNamed(context, '/editProductList',
                                   arguments:Product(productName:element.productName,imgUrl:element.imgUrl,price:element.price,description:element.description,category:element.category,condition:element.condition,brandName:element.brandName),
                                   ),

                                     
                                      )
                                      

                                     
                                   );
                                   print("hello");
                                   print("Image url is ${element.imgUrl}");
                                 });
                              //data
                            }
                        }
                          
                        print(
                            "::::::::::::::::::::::::::::::::::::::::::::::::::::::");
                        return children == null ?  Container(
                          height: MediaQuery.of(context).size.height * 0.50,
                        
                         
                        ):
                      
                        GridView.count(

                             crossAxisCount: 2,
                             crossAxisSpacing:10,
                             mainAxisSpacing: 2,
                             childAspectRatio: 0.90,
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             children: children,
                              );
                       
                      },

                
                                                
                            ),
          
            SizedBox(height:60)
            
          ],
        ),
      ),
    ));
  }
}
// class DealerSingleProduct extends StatefulWidget {
//    String name;
//     String imgUrl;
//     String price;
//   @override
//   _DealerSingleProductState createState() => _DealerSingleProductState();

// }

// class _DealerSingleProductState extends State<DealerSingleProduct> {
  
//   @override
//   Widget build(BuildContext context) {
   

//     return  FlatButton(
//       padding: EdgeInsets.all(0),
//           child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8.0),
//             ),
//             side: BorderSide(color: Theme.of(context).primaryColor,width: 1)
//           ),
          
//           borderOnForeground: false,
//            color: greyColor,
//           // elevation: 0.1,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: ClipRRect(   
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),),
//                   child: Image.network(widget.imgUrl ?? "",height: 130,fit: BoxFit.contain,width: 130,)),
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                 SizedBox(height:10),
//                 Text(widget.name ??"",style:Theme.of(context).textTheme.caption),
//                 SizedBox(height:10),
//                 Text("\u20B9 ${widget.price}/-",style:Theme.of(context).textTheme.caption),
//                 SizedBox(height:10),
//               ],
//               )
//               )
//             ],
//           ),
//       ),
//       onPressed:()=>Navigator.pushNamed(context, '/editProductList'),
//     );
//   }
// }