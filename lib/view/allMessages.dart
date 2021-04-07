import 'package:flutter/material.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/pageLabel.dart';

class AllMessages extends StatefulWidget {
  AllMessages({Key key}) : super(key: key);

  @override
  _AllMessagesState createState() => _AllMessagesState();
}

class _AllMessagesState extends State<AllMessages> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageLabel(label: "Messages",),
            SizedBox(height: 10),
            SingleChatTile(),
            SizedBox(height: 10),
            SingleChatTile(),
          ],
        ),
      );
  }
}



class SingleChatTile extends StatelessWidget {
  const SingleChatTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: greyColordark,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: greyColordark,
        shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
            side: BorderSide(color: Theme.of(context).primaryColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //  SizedBox(width: 10,),
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
              child: Container(
                decoration: BoxDecoration(
                  color: greyColordark,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lenovo IdeaPad",
                        style: Theme.of(context).textTheme.headline6,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: Text(
                      "This is the last sent message This is the last sent This is the last sent message This is the last sent message...",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "10:30 am ",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      )
                    ],
                  ),

                  // SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
