import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color.dart';

class CategoryListTile extends StatelessWidget {
  final String iconPathSvg;
  final String title;
  final Function onTap;
  const CategoryListTile({Key key, this.iconPathSvg, this.title,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        tileColor: greyColordark,
        leading: SvgPicture.asset(
          this.iconPathSvg,
          width: 50,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(this.title, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
