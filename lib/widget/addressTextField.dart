import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textField(String label,bool readOnly,TextEditingController controller,{Function(String) validator,TextInputType keyboard = TextInputType.text}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
    readOnly: readOnly,
    validator: validator,
    keyboardType: keyboard,
  );
}