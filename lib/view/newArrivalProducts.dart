import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/filter.dart';
import 'package:whynew_new/model/product.dart';
import 'package:whynew_new/model/productPageArgs.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/productWidget.dart';

class GetNewArrivalProduct extends StatefulWidget {
  GetNewArrivalProduct({Key key}) : super(key: key);

  @override
  _GetNewArrivalProductState createState() => _GetNewArrivalProductState();
}

class _GetNewArrivalProductState extends State<GetNewArrivalProduct> {
  @override
  Widget build(BuildContext context) {
    CategoryPageArgs args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(height:50,
          width:150,
          decoration:BoxDecoration(color:Colors.blue),
          child:FilterButton(),
          ),
         
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonCustom(),
          SingleCategoryTitle(args: args),
          SizedBox(height: 20),
          CategoryProducts(categoryName: args.categoryName,)
        ],
      ),
    ));
  }
}

class SingleCategoryTitle extends StatelessWidget {
  const SingleCategoryTitle({
    Key key,
    @required this.args,
  }) : super(key: key);

  final CategoryPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20,right:20,top:0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(args.categoryName,style: Theme.of(context).textTheme.headline4),
          SvgPicture.asset(
            args.svgUrl,
            width: 50,
          )
        ],
      ),
    );
  }
}

class CategoryProducts extends StatelessWidget {
  final String categoryName;
  const CategoryProducts({
    this.categoryName,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final appState = Provider.of<Appstate>(context);
    return  
    Expanded(
                                child: FutureBuilder<List<Product>>(
                               future:appState.getNewArrivalProduct(),
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
                               //appState.getOurFishProduct().forEach((element) {
                                   children.add(ProductBoxFuture(
                                       imgUrl: element.imgUrl,
                                       name:element.productName,
                                       
                                        price: element.price.toString(),
                                     
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
                             crossAxisSpacing:15,
                             mainAxisSpacing: 10,
                             childAspectRatio: 0.78,
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             children: children,
                              );
                       
                      },

                
                                                
                            ),
               );
  }
}
class ProductBoxFuture extends StatelessWidget {
final String imgUrl;
final String name;
final String price;
final Product productDetail;
  const ProductBoxFuture({Key key, this.imgUrl,this.name,this.price,this.productDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: ()=> Navigator.pushNamed(context, '/SingleProduct',arguments:productDetail ),
          child: Card(
        shape: RoundedRectangleBorder(
       
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          side: BorderSide(color: Theme.of(context).primaryColor,width: 1)
        ),
        
        borderOnForeground: false,
         color: greyColor,
        // elevation: 0.1,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding( 
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(   
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),),
                child: Image.network(this.imgUrl,height: 130,fit: BoxFit.contain,width: 130,)),
            ),
            Container(
               
              padding: EdgeInsets.only(left: 10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height:10),
              Text(this.name,style:Theme.of(context).textTheme.caption),
              SizedBox(height:10),
              Text("\u20B9 ${this.price}/-",style:Theme.of(context).textTheme.caption),
              SizedBox(height:10),
            ],),)
          ],
        ),
      ),
    );
  }
}