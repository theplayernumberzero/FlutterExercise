import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(), //Clean code
      backgroundColor: Colors.white,
      body: Column(
        children: [
          searchField(),
        ],
      ),
    );
  }
}

AppBar appBar(){
  return AppBar(
    title: const Text("Breakfast", style: TextStyle(color:Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SvgPicture.asset("assets/icons/left-arrow.svg",
          height: 10,
          width: 10,),
        decoration: BoxDecoration(
            color: Color(0xfff7f8f8),
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    ),
    actions: [
      GestureDetector(  //for make it clickable
        onTap: (){

        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 37,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xfff7f8f8),
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset("assets/icons/three-dots-menu.svg",
            height: 10,
            width: 10,),
        ),
      ),
    ],
  );
}

Container searchField(){
  return Container(
    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xff1d1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0
          )
        ]
    ),
    child: TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(
            color: Color(0xffdddada),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                color: Colors.transparent,
                width: 20,
                height: 20,
                child: SvgPicture.asset('assets/icons/search.svg')),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(  //If you want to use divider in row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 10, //üstten ve alltan boşul
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none //Alt çizgiyi kaldırır
          )
      ),
    ),
  );
}