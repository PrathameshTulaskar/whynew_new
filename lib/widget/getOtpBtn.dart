import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetOtpBtn extends StatelessWidget {
  final String title;
  final bool isHalfPage;
  final bool iconVisible;
  final Function onClick;
  final bool svgImg;
  final String svgPath;

  const GetOtpBtn({
    this.isHalfPage = true,
    this.svgPath,
    this.svgImg=false,
    this.iconVisible = true,
    this.title,
    Key key,this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.isHalfPage
          ? MediaQuery.of(context).size.width * 0.50
          : MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(-1.0, 3.0),
                blurRadius: 2,
                spreadRadius: 0.01,
                color: Colors.grey),
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20.0)),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              this.title,
              style: TextStyle(color: Colors.white),
            ),
            this.iconVisible ? SizedBox(width: 5) : SizedBox(),
            this.iconVisible && !this.svgImg
                ? Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : SizedBox(),
                this.svgImg ? 
                SvgPicture.asset(this.svgPath ,width: 22,color: Colors.white,):SizedBox()
          ],
        ),
      ),
    );
  }
}
