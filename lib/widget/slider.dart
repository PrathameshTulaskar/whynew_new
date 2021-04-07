
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whynew_new/provider/appstate.dart';
import 'package:carousel_slider/carousel_slider.dart';
class FullscreenSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    List<Widget> slides = List<Widget>.generate(appState.sliderList.length,(index)
               
                {
                  return Container(
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(left: 10,right: 10),
              // padding: EdgeInsets.only(left: 25,right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  // image: NetworkImage("https://images.unsplash.com/photo-1602080858428-57174f9431cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"),
                 image:NetworkImage(appState.sliderList[index].imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
    //                Column(children: [
    //     ApproveProductRequest(
    //                                    name:appState.productDetails[index].name, 
    //                                    price:appState.productDetails[index].price,
    //                                    //category:snapshot.data[index].category,
    //                                    imgUrl:appState.productDetails[index].imgUrl,
    //                                    category:appState.productDetails[index].category
    //                                   //  address:snapshot.data[index].address,
    //                                      )
    //    // Text(appState.productCategory[index].name)
    //               ]
    // ,);

                }   );
            
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.90,
            //   margin: EdgeInsets.only(left: 10,right: 10),
            //   // padding: EdgeInsets.only(left: 25,right: 25),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     image: DecorationImage(
            //       // image: NetworkImage("https://images.unsplash.com/photo-1602080858428-57174f9431cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"),
            //      image:NetworkImage(appState.sliderList.imgUrl1),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // );
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       // Text(
            //       //   'Usable Flower for Health',
            //       //   style: TextStyle(
            //       //     color: Colors.white,
            //       //     fontWeight: FontWeight.bold,
            //       //     fontSize: 18.0,
            //       //   ),
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.all(15.0),
            //       //   child: Text(
            //       //     'Lorem Ipsum is simply dummy text use for printing and type script',
            //       //     style: TextStyle(
            //       //       color: Colors.white,
            //       //       fontSize: 15.0,
            //       //     ),
            //       //     textAlign: TextAlign.center,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.90,
            //   margin: EdgeInsets.only(left: 10,right: 10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     image: DecorationImage(
            //       //image: NetworkImage("http://quickyshop.in/QuickyAppPics/whynew2.jpg"),
            //       image:NetworkImage(appState.sliderList.imgUrl2),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       // Text(
            //       //   'Usable Flower for Health',
            //       //   style: TextStyle(
            //       //     color: Colors.white,
            //       //     fontWeight: FontWeight.bold,
            //       //     fontSize: 18.0,
            //       //   ),
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.all(15.0),
            //       //   child: Text(
            //       //     'Lorem Ipsum is simply dummy text use for printing and type script',
            //       //     style: TextStyle(
            //       //       color: Colors.white,
            //       //       fontSize: 15.0,
            //       //     ),
            //       //     textAlign: TextAlign.center,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.90,
            //   margin: EdgeInsets.only(left: 10,right: 10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     image: DecorationImage(
            //       //image: NetworkImage("http://quickyshop.in/QuickyAppPics/whynew1.png",),
            //      image:NetworkImage(appState.sliderList.imgUrl3),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       // Text(
            //       //   'Usable Flower for Health',
            //       //   style: TextStyle(
            //       //     color: Colors.white,
            //       //     fontWeight: FontWeight.bold,
            //       //     fontSize: 18.0,
            //       //   ),
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.all(15.0),
            //       //   child: Text(
            //       //     'Lorem Ipsum is simply dummy text use for printing and type script',
            //       //     style: TextStyle(
            //       //       color: Colors.white,
            //       //       fontSize: 15.0,
            //       //     ),
            //       //     textAlign: TextAlign.center,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
   // ];
    return Column(
      children: [
        CarouselSlider(  
          
          items: slides,

          options: CarouselOptions(
            height: 150.0,
            onPageChanged: (index, reason) {
                  appState.currentSliderIndexSetter = index;
              },
            // disableCenter: true,
            // enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            // enlargeStrategy: CenterPageEnlargeStrategy.scale
            viewportFraction: 0.99,
          ),
        ),
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides.map((url) {
              int index = slides.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appState.sliderIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
      ],
    );
  }
}
