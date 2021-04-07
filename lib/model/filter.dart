import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(Icons.filter_list, size: 40),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context)
                          // return StatefulBuilder(builder: (context, setState)
                          {
                        bool category = false;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return new AlertDialog(
                              title: new Text('Filter By'),
                              content: new SingleChildScrollView(
                                child: Column(
                                  children: [
//
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Text("Arrivals",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(width: 100),
                                          IconButton(
                                              icon: Icon(Icons.arrow_downward,
                                                  color: Colors.white),
                                              onPressed: () {}),
                                          IconButton(
                                              icon: Icon(Icons.arrow_upward,
                                                  color: Colors.white),
                                              onPressed: () {})
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Text("Price",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(width: 100),
                                          IconButton(
                                              icon: Icon(Icons.arrow_downward,
                                                  color: Colors.white),
                                              onPressed: () {}),
                                          IconButton(
                                              icon: Icon(Icons.arrow_upward,
                                                  color: Colors.white),
                                              onPressed: () {})
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      );
                }
                ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Filter"),
            )
          ],
        ));
  }
}
