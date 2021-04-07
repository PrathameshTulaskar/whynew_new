import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/model/credentials.dart';
import 'package:whynew_new/model/customer.dart';
import 'package:whynew_new/model/dealer.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/getOtpBtn.dart';

class AddRegistrationDetail extends StatefulWidget {
  final Credentials userData;
 
  final Customer customer;
  AddRegistrationDetail({Key key, this.userData,this.customer}) : super(key: key);

  @override
  _AddRegistrationDetailState createState() => _AddRegistrationDetailState();
}

class _AddRegistrationDetailState extends State<AddRegistrationDetail> {
  DateTime currentDate = DateTime.now();
  
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1995),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });

  }
  @override
  final _formkey = GlobalKey<FormState>();
  
  bool isDateEmpty= false;
   DateFormat formatter = DateFormat("dd-MM-yyyy ");
                        
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    
    String formatted = formatter.format(currentDate);   
    print("user Id is ${widget.userData.userId}");
    print(
        "Email:${widget.userData.emailAddress ?? ""},ContactNumber:${widget.userData.contactNumber ?? ""},UserId:${widget.userData.userId ?? ""}, ProfileUrl:${widget.userData.profileUrl ?? ""}");
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formkey,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage("${widget.userData.profileUrl ?? ""}"),
                      // child:
                      //     Image.network("${widget.userData.profileUrl ?? ""}"),
                      // Icon(
                      //   Icons.person,
                      //   color: Theme.of(context).primaryColor,
                      //   size: 70,
                      // ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                            controller: appState.fnameController,
                            decoration: new InputDecoration(
                              hintText: "First Name",
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: TextFormField(
                            controller: appState.lnameController,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Text is empty';
                              }
                              return null;
                            },
                            // controller: appState.emailController,
                            decoration: new InputDecoration(
                              hintText: "Last Name",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Visibility(
                      child: TextFormField(
                        validator: (text ) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                        controller: appState.contactNumberController,
                        decoration: new InputDecoration(
                          hintText: "${widget.userData.contactNumber ?? "contact Number" }  ",
                        ),
                      ),
                      visible:true,
                      // visible:widget.userData.contactNumber.length ==null ? true : false,
                      replacement:Container(),
                    ),
                    SizedBox(height: 10),
                    
                    TextFormField(
                      controller:appState.birthDateController,
                      readOnly: true,
                      onTap:() => _selectDate(context) ,
                      // validator: (text) {
                        
                      //   if (text == null || text.isEmpty) {
                      //     return 'Text is empty';
                      //   }
                      //   return null;
                      // },
                  //controller: appState.emailController,
                      decoration: new InputDecoration(
                        hintText: formatted,
                      ),
                    ),
            //         Row(children: [
            //           Text(currentDate.toString()),
            // RaisedButton(
            //   onPressed: () => _selectDate(context),
            //   child: Text(' BirthDate'),
            // ),
            //         ],),
                    // FlatButton(child: Text("date"),onPressed:()=>{}),
                    SizedBox(height: 10),
                    Visibility(
                      child: TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                        // controller: "${widget.userData.emailAddress}" ,
                        controller:appState.emailController,
                        decoration: new InputDecoration(
                          hintText: "Email",
                        
                        ),
                      ),
                      visible:true,
                      // visible:widget.userData.emailAddress.length==null ? true : false,
                      replacement:Container(),
                    ),
                    SizedBox(height: 10),
                    // Visibility(
                    //   child: TextFormField(
                    //     validator: (text) {
                    //       if (text == null || text.isEmpty) {
                    //         return 'Text is empty';
                    //       }
                    //       return null;
                    //     },
                    //     // controller: appState.emailController,
                    //     decoration: new InputDecoration(
                    //       hintText: "GST",
                    //     ),
                    //   ),
                    //   visible: appState.isDealer,
                    //   replacement: Container(),
                    // ),
                    SizedBox(height: 30),
                    GetOtpBtn(
                        title: "Login",
                        onClick: () {
                          
                          if (_formkey.currentState.validate()) {
                            if(appState.birthDateController.text==null){
                             setState(() {
                               isDateEmpty=true;
                             });
                            }else{
                              setState(() {
                               isDateEmpty=false;
                             });
                            }
                            Navigator.pushNamed(context, '/home',
                            arguments:Customer(customerId:appState.userId)) ?? Dealer(dealerId:appState.userId);
                            //  appState.addCustomer(widget.userData.userId);

                            if(appState.isDealer==true){
                              appState.addDealer();
                            }else{
                            appState.addCustomer();
                            }
                             
                          } else {
                            print("Enter Valid Data");
                          }
                          // Navigator.pushNamed(context, '/locationAdd')
                        })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/image/bottom-leftLogin.png",
              width: 176,
              fit: BoxFit.contain,
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/image/top-rightLogin.png",
                width: 178,
                fit: BoxFit.contain,
              )),
        ]),
      )),
    );
  }
}

