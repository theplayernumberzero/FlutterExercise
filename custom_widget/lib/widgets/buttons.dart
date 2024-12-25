// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  //Paramaetreler için constructor oluşturacağım
  String buttonText;
  Color textColor;
  Color buttonColor;
  //When we tap this button there will be no return
  VoidCallback callback;
  ButtonComponent({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.buttonColor,
    required this.callback,
  });

  //Statlessta widget kullanmana gerek yok
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 100,
        decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
