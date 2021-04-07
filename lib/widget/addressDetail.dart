import 'package:flutter/material.dart';

import 'color.dart';

class Addresses extends StatelessWidget {
  final String addressType;
  final String address;
  final Function onEdit;
  final Function onDelete;
  const Addresses({
    Key key,
    this.address,
    this.onDelete,
    this.onEdit,
    this.addressType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shortAddressType;
    if(addressType.length > 27){
      shortAddressType = addressType.substring(0,27);
    }
    Widget icon;
    switch (addressType) {
      case "Home":
        icon = Icon(Icons.home,color: Theme.of(context).primaryColor,);
        break;
      case "Work":
      icon = Icon(Icons.work,color: Theme.of(context).primaryColor,);
      break;
      default:{
        icon = Icon(Icons.location_on,color: Theme.of(context).primaryColor,);
      }
    }
    return ListTile(
      tileColor: Colors.white,
      leading: icon,
      title: Text(shortAddressType == null ? addressType : "$shortAddressType..."
       ,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(address),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 34,
                child: FlatButton(
                  onPressed: onEdit,
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              FlatButton(
                  onPressed: onDelete,
                  child: Text(
                    "DELETE",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey[600],
            thickness: 0.3,
            height: 0,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
      onTap: (){},
    );
  }
}