import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/model/filter.dart';
import 'package:whynew_new/model/productCategories.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/categoryTile.dart';
import 'package:whynew_new/widget/pageLabel.dart';

class AllCategories extends StatefulWidget {
  AllCategories({Key key}) : super(key: key);

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return Scaffold(
      // floatingActionButton:FilterButton(),
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageLabel(label: " Category"),
            SizedBox(height: 10),
            FutureBuilder<void>(
                                 future: appState.fetchProductCategory(),
                                 builder: (context, snapshot) {
                     //switchCase Loader
                  
                  
                   return Column(
                     children:List<Widget>.generate(appState.productCategory.length,(index)
                {
                  return  CategoryListTile(
              iconPathSvg: appState.productCategory[index].icon,
              title: appState.productCategory[index].name,
              onTap: () => Navigator.pushNamed(context, '/SingleCategory',arguments: CategoryPageArgs(
                categoryId: appState.productCategory[index].id,categoryName: appState.productCategory[index].name ,svgUrl:  appState.productCategory[index].icon
              )),
            );

    //                    Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             // crossAxisAlignment: CrossAxisAlignment.start,
    //            // print("hellooooooooo:${snapshot.data.length}"),
    //             children:List<Widget>.generate(appState.productCategory.length,(index)
    //             {
    //               return  Column(children: [
    //     InkWell(child: Image.network(appState.productCategory[index].icon,width: 60,height: 60),onTap:()=>Navigator.pushNamed(context, '/SingleCategory',arguments: CategoryPageArgs(
    //             categoryId: appState.productCategory[index].id,categoryName:appState.productCategory[index].name ,svgUrl: appState.productCategory[index].icon
    //           )),
    //           ),
    //     Text(appState.productCategory[index].name)
    //               ]
    // ,);

    //             }
                          
    //                        ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             // crossAxisAlignment: CrossAxisAlignment.start,
    //            // print("hellooooooooo:${snapshot.data.length}"),
    //             children:List<Widget>.generate(appState.productList==null ? 0 :appState.productList.length,(index){


    //               return index>3 && index <8 ?
    //               ProductBoxFuture( price:snapshot.data[index].price,
    //                   imgUrl:snapshot.data[index].imgUrl,
    //                   name:snapshot.data[index].name, 
    //                    ):Container();

    //             }
                              
    //                            ),
    //           ),
                   
                 } ),);
                      
                                 },
                               ),
            // CategoryListTile(
            //   iconPathSvg: "assets/svg/laptop.svg",
            //   title: "Laptop",
            //   onTap: () => Navigator.pushNamed(context, '/SingleCategory',arguments: CategoryPageArgs(
            //     categoryId: "2",categoryName: "Laptop",svgUrl: "assets/svg/laptop.svg" 
            //   )),
            // ),
            // SizedBox(height: 10,),
            // CategoryListTile(
            //   iconPathSvg: "assets/svg/computer.svg",
            //   title: "Desktop",
            //   onTap: () => Navigator.pushNamed(context, '/SingleCategory',arguments: CategoryPageArgs(
            //     categoryId: "2",categoryName: "Desktop",svgUrl: "assets/svg/computer.svg" 
            //   ))
            // ),
            // SizedBox(height: 10,),
            // CategoryListTile(
            //   iconPathSvg: "assets/svg/headphones.svg",
            //   title: "Accessories",
            //    onTap: () => Navigator.pushNamed(context, '/SingleCategory',arguments: CategoryPageArgs(
            //     categoryId: 2,categoryName: "Accessories",svgUrl: "assets/svg/headphones.svg" 
            //   ))
            // ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}














