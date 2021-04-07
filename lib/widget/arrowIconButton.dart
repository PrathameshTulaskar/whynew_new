import 'package:flutter/material.dart';
import 'package:whynew_new/model/order.dart';

class ButtonWithIcon extends StatelessWidget {
  final String title;
  final bool isHalfPage;
  final String routeName;
  final bool iconVisible;
  final Function onPressed;
  final Order orderDetails;
  
  const ButtonWithIcon({
    this.isHalfPage = true,
    this.iconVisible = true,
    this.onPressed,
    this.title,
    this.routeName,
    this.orderDetails,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.isHalfPage
          ? MediaQuery.of(context).size.width * 0.50
          : MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        // onPressed: () => Navigator.pushNamed(context, this.routeName),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.title),
            this.iconVisible ? SizedBox(width: 5) :SizedBox() ,
            this.iconVisible ? Icon(Icons.arrow_forward):SizedBox()
          ],
        ),
      ),
    );
  }
}
