import 'package:flutter/material.dart';

class PageLabel extends StatelessWidget {
  final String label;
  const PageLabel({
    Key key,this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        this.label,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}