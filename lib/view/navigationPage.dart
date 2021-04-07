import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/view/allCategories.dart';
import 'package:whynew_new/view/allMessages.dart';
import 'package:whynew_new/view/homePage.dart';
import 'package:whynew_new/view/profile.dart';
import 'package:whynew_new/widget/footer.dart';
import 'package:whynew_new/widget/header.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return SafeArea(
      child: Scaffold(
        appBar: header(context, null, null),
        drawer: HeaderMenu(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: 
        Visibility(
                  child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 65),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(
                      // color: Colors.blue,
                    ),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: FlatButton(
                  child: Row(
                    children: [
                      Icon(Icons.add,color: Colors.white),
                      Text("Add product",style:TextStyle(color: Colors.white)),
                    ],
                  ),
                  // backgroundColor: Colors.blue,
                  onPressed: ()=> Navigator.pushNamed(context, '/allProduct'),
                ),
              ),
            ),
          ),
          visible: !(appState.isClient),
         
          replacement:Container(),
        ),
        bottomNavigationBar: Footer(
          menuOne: "Home",
          menuTwo: "Chat",
          menuThree: "Categories",
          menuFour: "My Account",
          menuOneIcon: Icons.home,
          menuTwoIcon: Icons.chat,
          // menuThreeIcon: Icons.menu,
          menuFourIcon: Icons.person,
        ),
        body: (appState.currentIndexFooter == 0)
            ? Homepage()
            : (appState.currentIndexFooter == 1)
                ? AllMessages()
                : (appState.currentIndexFooter == 2)
                    ? AllCategories()
                    : Profile(),
      ),
    );
  }
}