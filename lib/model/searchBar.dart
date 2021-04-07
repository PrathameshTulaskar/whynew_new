import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {


  @override
  Widget build(BuildContext context) {
 
    return Container(
     width:235,
          height:35,
          decoration: BoxDecoration(
         
         color:Colors.white,
         border:Border.all(color: Colors.black)
          ),
       child: Row(mainAxisAlignment:MainAxisAlignment.start,
         children: [
            Icon(Icons.search),
            Text("Search"),
         ],
       )
    );
  }
}