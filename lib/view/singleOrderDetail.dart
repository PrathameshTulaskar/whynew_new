import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whynew_new/widget/backButton.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/pageLabel.dart';

class SingleOrderDetail extends StatefulWidget {
  SingleOrderDetail({Key key}) : super(key: key);

  @override
  _SingleOrderDetailState createState() => _SingleOrderDetailState();
}

class _SingleOrderDetailState extends State<SingleOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonCustom(),
            PageLabel(label: "Order Details"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderDetailSecOne(),
                  StraightLine(),
                  CircleStatusWidget(
                    date: "31st Sept 2020",
                    statusTitle: "Shipped",
                    svgUrl: "assets/svg/shipped.svg",
                    color: Colors.orange,
                  ),
                  StraightLine(
                    color: Colors.orange,
                  ),
                  CircleStatusWidget(
                    date: "1st Nov 2020",
                    statusTitle: "Delivered",
                    svgUrl: "assets/svg/check.svg",
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ContactSupport(),
            SizedBox(height: 20),
            ShippingDetailsBox(),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}

class ShippingDetailsBox extends StatelessWidget {
  const ShippingDetailsBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping Details",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 18),
                    Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Divesh Naik "),
                            Text(
                                "Near bhumika temple Panjim - Goa403202"),
                          ],
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.orange,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset(
                            "assets/svg/shipped.svg",
                            width: 34.0,
                            color: Colors.orange),
                      )),
                ),
              ],
            )),
        color: greyColordark,
      ),
    );
  }
}

class ContactSupport extends StatelessWidget {
  const ContactSupport({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Theme.of(context).primaryColor),
            width: 180,
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset("assets/svg/headphones.svg",
                    width: 20, color: Colors.white),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Contact Support",
                  style: TextStyle(color: Colors.white),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StraightLine extends StatelessWidget {
  final Color color;
  const StraightLine({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 38),
      child: Container(
        height: 40,
        color: this.color ?? Theme.of(context).primaryColor.withOpacity(0.5),
        width: 1,
      ),
    );
  }
}

class OrderDetailSecOne extends StatelessWidget {
  const OrderDetailSecOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          color: greyColor,
          border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("Order ID: #WN0000123"),
                    SizedBox(height: 10),
                    Text(
                      "Lenovo IdeaPad",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: 20),
                    Text("Rs, 45,000/-"),
                    SizedBox(height: 20),
                    Text("QTY: 1"),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CircleStatusWidget(
                date: "29th Sept 2020",
                statusTitle: "Ordered",
                svgUrl: "assets/svg/order.svg",
              )
            ],
          ),
          Column(
            children: [
              Image.network(
                "https://www.whynew.in/wp-content/uploads/2019/07/Used-_-Unused-_-Refurbished-18.png",
                width: 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CircleStatusWidget extends StatelessWidget {
  final String svgUrl;
  final String statusTitle;
  final String date;
  final Color color;
  const CircleStatusWidget(
      {Key key,
      @required this.date,
      @required this.statusTitle,
      @required this.svgUrl,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: this.color ??
                        Theme.of(context).primaryColor.withOpacity(0.5))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                // "assets/svg/order.svg",
                this.svgUrl,
                width: 34.0,
                color: this.color ?? Theme.of(context).primaryColor,
              ),
            )),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.statusTitle),
            SizedBox(
              height: 5,
            ),
            Text(
              this.date,
              style: Theme.of(context).textTheme.overline,
            )
          ],
        ),
      ],
    );
  }
}
