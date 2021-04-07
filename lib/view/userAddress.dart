import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:whynew_new/model/map_picker.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:whynew_new/widget/addressTextField.dart';
import 'package:whynew_new/widget/borderBtn.dart';
import '../keys.dart';
import 'locationPicker.dart';

class LocationAdd extends StatefulWidget {
  LocationAdd({Key key}) : super(key: key);

  @override
  _LocationAddState createState() => _LocationAddState();
}

class _LocationAddState extends State<LocationAdd>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> formKeySupermarket = GlobalKey<FormState>();
  // Completer<GoogleMapController> _controller = Completer();
  // Mode googleMapMode = Mode.overlay;
  double btnFullWidth = 160.0;
  bool addMoreDetails = false;
  PanelController slideUp;
  // LatLng currentP;
  bool homeBtn = false;
  bool workBtn = false;
  bool otherBtn = false;
  bool error = false;
  @override
  void initState() {
    Provider.of<Appstate>(context, listen: false).fetchCurrentLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    
    final String supermarketUrl = ModalRoute.of(context).settings.arguments;
    var maxHeight = MediaQuery.of(context).size.height * 0.80;
    var selectedColor = Theme.of(context).primaryColor;
    // Geolocator().getCurrentPosition().then((value) {
    //   setState(() {
    //     currentP = LatLng(value.latitude, value.longitude);
    //   });
    // });
    return Scaffold(
    body: appState.userAddress == null ?  
    Container(
      //width: fullWidth(context),
      //height: fullHeight(context),
      child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Icon(Icons.location_off,size: 50,),
          Text("Enable Location Service."),
        ],
      ))) :
    SlidingUpPanel(
        controller: slideUp,

        isDraggable: true,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
        minHeight: MediaQuery.of(context).size.height * 0.50,
        // maxHeight: MediaQuery.of(context).size.height * 0.80,

        panel: SingleChildScrollView(
                  child: Container(
    //height: fullHeight(context),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BorderHighlight(),
            SizedBox(height: 15),
            Text(
              "Business Details",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 15),
            Form(
              key: formKeySupermarket,
              //autovalidate: true,
              child: Column(
                children: <Widget>[
                //  TextFormField("Business Name", false, appState.businessNameController,
                //           validator:(text){
                //             if(text==null || text.isEmpty){
                //               return 'text is Empty';
                //             }
                //             return null;
                //           }
                //       ),
                  SizedBox(height: 10),

                  textField("LOCATION",true,appState.locationController),
                  SizedBox(height: 10),
                             
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      textField("PINCODE", false, appState.pinCodeController,
                          validator: (value) {
                        if (value.length < 5)
                          return 'Please specify more in detail';
                        else
                          return null;
                      }, keyboard: TextInputType.number),
                      SizedBox(height: 10),
                      textField("LANDMARK", false, appState.landMarkController,
                          validator: (value) {
                        if (value.length < 5)
                          return 'Please specify more in detail';
                        else
                          return null;
                      }, keyboard:TextInputType.text),
                    ],
                  ),
                  Visibility(child: Text("something went wrong",style: TextStyle(color: Colors.red)),visible: error,),
                  SizedBox(height: 20),          
                            BorderBtn(
                                 borderColor: Colors.red,
                                fullWidthBtn: true,
                                buttonText: "ADD BUSINESS",
                                onBtnPress: () async{
                                  if(formKeySupermarket.currentState.validate()){
                                    // var response = await appState.addFishBusiness();
                                    var response;
                                    if(response){
                                      setState(() {
                                        error = false;
                                      });
                                      Navigator.pushNamed(context, '');
                                        
                                    }else{
                                      setState(() {
                                        error = true;
                                      });
                                    }
                                  }
                            }),
                            SizedBox(
                              height: 4,
                            ),
                ],
              ),
            )
          ],
      ),
    ),
          ),
        ),
        body: Stack(children: <Widget>[
    // PlacePickerScreen(
    //   googlePlacesApiKey: goolePlaceApiKey,
    //   initialPosition: appState.userAddress,
    //   mainColor: Theme.of(context).primaryColor,
    //   mapStrings: MapPickerStrings.english(),
    //   placeAutoCompleteLanguage: 'es',
    // ),
    Positioned(
      child: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context)),
      top: 25,
    )
        ]),
        // GoogleMap(
        //   initialCameraPosition: CameraPosition(target: currentP,zoom: 14.4746),
        //   mapType: MapType.hybrid,
        //   onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        // },
        // )
      ));
  }
}

class FillColorBtn extends StatelessWidget {
  final double btnWeight;
  const FillColorBtn({Key key, this.btnWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () => print("hello"),
        child: Container(
          width: btnWeight ?? null,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("CONFIRM LOCATION",
                  style: Theme.of(context).textTheme.button),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.grey[200]),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0));
  }
}

class BorderHighlight extends StatelessWidget {
  const BorderHighlight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 35,
              height: 5,
              color: Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }
}

 