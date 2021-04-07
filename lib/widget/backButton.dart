import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),padding: EdgeInsets.only(left:20,top:15,bottom: 5),);
  }
}