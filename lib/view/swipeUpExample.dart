import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:swipe_up/swipe_up.dart';
import 'package:whynew_new/view/login.dart';

class SwipeUpExample extends StatefulWidget {
  @override
  _SwipeUpExampleState createState() => _SwipeUpExampleState();
}

class _SwipeUpExampleState extends State<SwipeUpExample> {
  @override
  Widget build(BuildContext context) {
    return SwipeGestureRecognizer(
     
       
        // onSwipeDown: () {
        //     // DO STUFF WHEN LEFT SWIPE GESTURE DETECTED
        // },
       
        onSwipeUp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SecondPage()));
        },
        child: Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('COOL',
                    style: TextStyle(color: Colors.white, fontSize: 94.0)),
                Text('NEW',
                    style: TextStyle(color: Colors.white, fontSize: 166.0)),
                Text('STUFF',
                    style: TextStyle(color: Colors.white, fontSize: 94.0))
              ],
            ),
          ),
        ),
        //  child: Material(
        //     color: Colors.transparent,
        //     child: Text('Swipe Up', style: TextStyle(color: Colors.white)));
       
    );
    
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwipeGestureRecognizer(
     
       
        // onSwipeDown: () {
        //     // DO STUFF WHEN LEFT SWIPE GESTURE DETECTED
        // },
       
        onSwipeDown: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginUi()));
        },
        child: Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('STUFF',
                    style: TextStyle(color: Colors.white, fontSize: 94.0)),
                Text('COOL',
                    style: TextStyle(color: Colors.white, fontSize: 94.0)),
                Text('NEW',
                    style: TextStyle(color: Colors.white, fontSize: 94.0))
              ],
            ),
          ),
        ),
        //  child: Material(
        //     color: Colors.transparent,
        //     child: Text('Swipe Up', style: TextStyle(color: Colors.white)));
       
    );
  }
}