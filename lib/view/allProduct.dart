import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/cateoryPageArgs.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/categoryTile.dart';
import 'package:whynew_new/widget/pageLabel.dart';

class AllProduct extends StatefulWidget {
  AllProduct({Key key}) : super(key: key);
 @override
  _AllProductState createState() => _AllProductState();
}
class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) { final appState = Provider.of<Appstate>(context);
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(),
            body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageLabel(label: " Select Category"),
              SizedBox(height: 10),
              Column(children:List<Widget>.generate(appState.productCategory.length,(index)
                {
                  return  Column(children: [
        CategoryListTile(
                iconPathSvg: appState.productCategory[index].icon,
                title: appState.productCategory[index].name,
                onTap: () => Navigator.pushNamed(context, '/singleItem',arguments: CategoryPageArgs(
                  categoryId: appState.productCategory[index].id,categoryName: appState.productCategory[index].name,svgUrl:  appState.productCategory[index].icon
                )),
              ),
        //Text(appState.productCategory[index].name)
                  ]
    ,);

                }   ),),
              
              // SizedBox(height: 10,),
              // CategoryListTile(
              //   iconPathSvg: "assets/svg/computer.svg",
              //   title: "Desktop",
              //   onTap: () => Navigator.pushNamed(context, '',arguments: CategoryPageArgs(
              //     categoryId: 2,categoryName: "Desktop",svgUrl: "assets/svg/computer.svg" 
              //   ))
              // ),
              // SizedBox(height: 10,),
              // CategoryListTile(
              //   iconPathSvg: "assets/svg/headphones.svg",
              //   title: "Accessories",
              //    onTap: () => Navigator.pushNamed(context, '',arguments: CategoryPageArgs(
              //     categoryId: 2,categoryName: "Accessories",svgUrl: "assets/svg/headphones.svg" 
              //   ))
              // ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
