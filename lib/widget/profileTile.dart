import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'color.dart';

class ProfileListTile extends StatelessWidget {
  final String iconPathSvg;
  final String title;
  final Function onClick;
  const ProfileListTile({Key key, this.iconPathSvg, this.title,this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20,right:20),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: greyColordark)
          )
        ),
        child: ListTile(
          
          // contentPadding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          // tileColor: greyColordark,
          leading: SvgPicture.asset(
            this.iconPathSvg,
            width: 30,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text(this.title, style: Theme.of(context).textTheme.subtitle1),
          onTap: onClick,
        ),
      ),
    );
  }
}
