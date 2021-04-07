import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';

AppBar header(context,leadingWidget,title){
  final appState=Provider.of<Appstate>(context);

  return AppBar(
  leading: leadingWidget,
  // title:Text("Hi ${appState.customer.customerName ?? ""}" ),
  // title:Visibility(child: Text("Hi  ${appState.dealerDetails.dealerName}" ??" " ),visible:appState.isDealer,
  // replacement: Text("Hi  ${appState.customer.customerName}" ?? " " ),
  // ),
  title:Text("Hi  ${appState.isAdmin && appState.isDealer == true ?appState.dealerDetails.dealerName == null ? "" :appState.dealerDetails.dealerName:appState.isClient == true ?appState.customer.customerName == null ? "" :appState.customer.customerName:appState.isDealer &&! appState.isAdmin ? appState.dealerDetails.dealerName==null? "":appState.dealerDetails.dealerName:"Guest"}" ),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () => print("hello"),
    ),
    Padding(
      padding: const EdgeInsets.only(right:3.0),
      child: InkWell(child: SvgPicture.asset("assets/svg/heart.svg", width: 22),onTap: () => print("hello"),),
    ),
    IconButton(padding: EdgeInsets.only(bottom: 2.0),icon: SvgPicture.asset("assets/svg/shopping-cart.svg", width: 22,color: Theme.of(context).primaryColor,),onPressed: () => Navigator.pushNamed(context, '/cart'),),
  ],
);
}
class HeaderMenu extends StatelessWidget {
  
  const HeaderMenu({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
      final appState = Provider.of<Appstate>(context);
    
  
        return Theme(
          data: Theme.of(context).copyWith(
           // Set the transparency here
           canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
              child: Drawer(
    
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
    
                  child: Container(
                    height:MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // SizedBox(
                        //   height:20
                        // ),
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: ()=>Navigator.pop(context),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.close,color: Colors.white,
                          ),
                            )),
                        ),
                          // SizedBox(height:150),
                          Container(
                            width:MediaQuery.of(context).size.width,
                            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(padding: EdgeInsets.only(left:0),onPressed: ()=> Navigator.pushNamed(context, '/home'),child: Text("Home",style: TextStyle(color: Colors.white,),),),
                                // FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, '/SingleCategory'),child: Text("Shop By Category",style: TextStyle(color: Colors.white),),),
                                FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, '/myOrders'),child: Text("My Orders",style: TextStyle(color: Colors.white),),),
                                // FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, '/profile'),child: Text("My Account",style: TextStyle(color: Colors.white),),),
                                FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, ''),child: Text("Become Dealer",style: TextStyle(color: Colors.white),),),
                                Visibility(
                                                              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, '/approveDealer'),child: Text("Approve Dealer ",style: TextStyle(color: Colors.white),),),
                                       FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, '/approveProducts'),child: Text("Approve Products ",style: TextStyle(color: Colors.white),),),
                                  FlatButton(padding: EdgeInsets.only(left:25),onPressed: ()=> Navigator.pushNamed(context, '/clientDealerHistory'),child: Text("Client/Dealer History ",style: TextStyle(color: Colors.white),),),
                                    ],
                                  ),
                                  visible:appState.isAdmin && appState.isDealer,
                                  replacement:Container(),
                            ),
                           
                          ],
                        ),),
                      )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}