import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/customer.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/color.dart';
import 'package:whynew_new/widget/profileTile.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool myorder = false;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PageLabel(label: "My Account"),
          SizedBox(height: 30),
          Visibility(
            child: ProfileName(
              
              name:appState.dealerDetails.dealerName
            ),
            visible:appState.isDealer ,
            replacement: ProfileName(name:appState.customer.customerName)
          ),

          SizedBox(height: 30),
          ProfileDetailBox(),
          // SizedBox(
          //   height: 20,
          // ),
          ProfileListTile(
            iconPathSvg: "assets/svg/shopping-bag.svg",
            title: "Product Status",
            onClick: () => Navigator.pushNamed(context, '/productStatus'),
          ),

          SizedBox(
            height: 20,
          ),
        
          appState.isDealer ==true ? ProfileListTile(
              iconPathSvg: "assets/svg/shopping-bag.svg",
              title: "My Orders",
              onClick: () {
                setState(() {
                  myorder = true;
                });
              }): ProfileListTile(
              iconPathSvg: "assets/svg/shopping-bag.svg",
              title: "My Orders",
              onClick: () {
                Navigator.pushNamed(context, '/myOrders');
                
              }),

          Visibility(
            child: MyOrder(),
            visible: myorder,
            replacement: Container(),
          ),
          SizedBox(
            height: 20,
          ),
          ProfileListTile(
            iconPathSvg: "assets/svg/map-book.svg",
            title: "Sales Report",
            onClick: () => Navigator.pushNamed(context, '/salesReport'),
          ),
          SizedBox(
            height: 30,
          ),
          ProfileListTile(
            iconPathSvg: "assets/svg/shopping-bag.svg",
            title: "My Product",
            onClick: () => Navigator.pushNamed(context, '/delerProductList'),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          ProfileListTile(
            iconPathSvg: "assets/svg/map-book.svg",
            title: "Manage Address",
            onClick: () => Navigator.pushNamed(context, '/manageAddress'),
          ),
          SizedBox(
            height: 20,
          ),
          LogoutSec(),
          SizedBox(
            height: 20,
          ),
        ],
      ),

    );
  }
}

class LogoutSec extends StatelessWidget {
  const LogoutSec({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.0, color: greyColordark))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 16),
              child: Text(
                "Logout",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetailBox extends StatelessWidget {
  final String email;
  final String mobileNumber;
  final String dob;
  final String currentAddress;
  final String value;
  const ProfileDetailBox(
      {Key key, this.email, this.currentAddress, this.dob, this.mobileNumber,this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final appState = Provider.of<Appstate>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: greyColordark,
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      print("object");
                      showDialog(
                          context: context,
                          builder: (ctxt) => new AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("User Details"),
                                  IconButton(icon:Icon(Icons.close),onPressed:(){Navigator.pop(context);}),
                                ],
                              ),
                              content: Container(
                                height:MediaQuery.of(context).size.height*0.70,
                                width:MediaQuery.of(context).size.width*0.90,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      
                                      new ListTile(
        leading: const Icon(Icons.phone),
        title: new TextField(
          controller: appState.contactNumberController,
          decoration: new InputDecoration(
            hintText: "Phone",
          ),
        ),
        
      ),
      new ListTile(
        leading: const Icon(Icons.email),
        title: new TextFormField(
         validator: (text) {
                                              if (text == null ||
                                                  text.isEmpty) {
                                                return 'Text is empty';
                                              }
                                              return null;
                                            },
          controller:appState.emailController,
          decoration: new InputDecoration(
            hintText: "Email",
          ),
        ),
      ),
      new ListTile(
        leading: InkWell(child: const Icon(Icons.today),onTap:(){}),
        title: const Text('Birthday'),
        subtitle: const Text('February 20, 1980'),
      ),
       new ListTile(
        leading: const Icon(Icons.home),
        title: new TextField(
          controller: appState.currentAddressController,
          
          decoration: new InputDecoration(
            hintText: "Current Address",
          ),
        ),
      ),
      
      Container(
        width: MediaQuery.of(context).size.width*0.23,
        child: FlatButton(
    color: Colors.black,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
          Center(
            child: Text(
                "Submit",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                fontSize: 15.0),
            ),
          ),
    ],
),
onPressed:(){
 try{ if(appState.isDealer==true){
    print("dealer");
    appState.updateDealerDetails();
  }else{
    print("customer");
    appState.updatecustomerDetail();
    }
    }catch (error){print(error);}
Navigator.pop(context);
}),
      )
                                    ],
                                  ),
                                ),
                              )));
                    })),
            // SizedBox(height:5),
            Column(
              
              children: [
                ProfileSubDetail(
                  icon: Icons.call,
                  label: "Mobile Number:",
                  value: appState.isDealer == true ?appState.dealerDetails.contactNumber == null ? "" :appState.dealerDetails.contactNumber:appState.isClient == true ?appState.customer.mobileNumber == null ? "" :appState.customer.mobileNumber:""  ,
                ),
                ProfileSubDetail(
                  icon: Icons.email,
                  label: "Email:",
                  value: appState.isDealer == true ?appState.dealerDetails.email == null ? "" :appState.dealerDetails.email:appState.isClient == true ?appState.customer.email == null ? "" :appState.customer.email:"" 
                ),
                ProfileSubDetail(
                  icon: Icons.date_range,
                  label: "DOB:",
                  value: appState.isDealer == true ?appState.dealerDetails.dob == null ? "" :appState.dealerDetails.dob:appState.isClient == true ?appState.customer.dob == null ? "" :appState.customer.dob:"" 
                ),

                ProfileSubDetail(
                  icon: Icons.location_city,
                  label: "Current Address:",
                  value:appState.isDealer == true ?appState.dealerDetails.currentAddress == null ? "" :appState.dealerDetails.currentAddress:appState.isClient == true ?appState.customer.currentAddress == null ? "" :appState.customer.currentAddress:"" 
                ),
                SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSubDetail extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Customer customer;
  final Dealer dealer;
  const ProfileSubDetail({Key key, this.icon, this.label, this.value,this.customer,this.dealer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                this.icon,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 5),
              Text(this.label)
            ],
          ),
          Text(this.value)
        ],
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  final String name;
  final String imgUrl;
  final Customer customerDetails;

  const ProfileName({
    Key key,this.imgUrl,
    this.name,
    this.customerDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child:
            Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
              size: 70,
            ),
          ),
        ),
        Text(this.name ?? "",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor)),
      ],
    );
  }
}

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("Sold", style: Theme.of(context).textTheme.subtitle1),
              onTap: () => Navigator.pushNamed(context, '/byProduct'),
            ),
          ),
          Container(
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("Purchased",
                  style: Theme.of(context).textTheme.subtitle1),
              onTap: () =>
                  Navigator.pushNamed(context, '/dealersPurchasedList'),
            ),
          ),
        ],
      ),
    );
  }
}
