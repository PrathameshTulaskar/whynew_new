import 'package:flutter/material.dart';


class OrderConfirmation extends StatefulWidget {
  OrderConfirmation({Key key}) : super(key: key);

  @override
  _OrderConfirmationState createState() =>  _OrderConfirmationState();
}

class  _OrderConfirmationState extends State< OrderConfirmation> {
  
  @override
  Widget build(BuildContext context) {
      String args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:BoxDecoration(color: Theme.of(context).primaryColor),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            SizedBox(height:50),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ORDER CONFIRMED",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold,)),
              ]
            ),
            SizedBox(height:20),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Order Number:$args #687687687",style: TextStyle(color: Colors.white,fontSize:14,)),
              ]
            ),
            SizedBox(height:90),
           CircleAvatar(radius: 100,
             
             backgroundColor: Colors.white, 
             child:Icon(Icons.check,size:200,color: Colors.green[800]),

           ),
           SizedBox(height:100),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
             children:[
              Container(
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                    // color: Colors.blue,
                  ),
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: FlatButton(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home,color: Colors.white),
                    Text("Home", style: TextStyle(color: Colors.white)),
                  ],
                ),
                // backgroundColor: Colors.blue,
                onPressed: ()=> Navigator.pushNamed(context, '/home'),
              ),
            ),



            Container(
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(
                    // color: Colors.blue,
                  ),
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: FlatButton(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.store,color: Colors.white),
                    Text("Shop More", style: TextStyle(color: Colors.white))
                  ],
                ),
                // backgroundColor: Colors.blue,
                onPressed: ()=> Navigator.pushNamed(context, ''),
              ),
            ),

             ]
           )
          ]
          
          

          )
        ),
      ),
    );
  }
}