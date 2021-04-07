import 'package:flutter/material.dart';

class BorderBtn extends StatelessWidget {
  final Color borderColor;
  final String buttonText;
  final bool fullWidthBtn;
  final Function onBtnPress;
  final double width;
  const BorderBtn({
   this.borderColor,
   this.buttonText = 'ADD MORE DETAILS',
   this.fullWidthBtn = false,
   this.onBtnPress,
   this.width

  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onBtnPress,
        child: Container(
          width: fullWidthBtn ? MediaQuery.of(context).size.width : width,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: borderColor,fontWeight: FontWeight.bold)),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: borderColor, width: 1)),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0));
  }
}