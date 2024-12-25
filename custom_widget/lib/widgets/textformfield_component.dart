// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatefulWidget {
  //add changable attributes
  TextInputType? textInputType;
  String hintText;
  bool? obscureText;
  TextEditingController controller;
  TextFormFieldComponent({
    super.key,
    this.textInputType,
    required this.hintText,
    this.obscureText,
    required this.controller,
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //constructordan alınan verilere "widget" keyword ile ulaşılır
      decoration: InputDecoration(hintText: widget.hintText),
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      keyboardType: widget.textInputType,
    );
  }
}
