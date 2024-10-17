import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_p/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_p/models/diet_model.dart';

import '../models/popular_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      appBar: appBar(), //Clean code
      backgroundColor: Colors.white,
      body: ListView( //For size of an screen error
        children: [
          searchField(),
          const SizedBox(height: 40,), //Create distance
          categoriesSection(),
           SizedBox(height: 40,),
           dietSection(),
          SizedBox(height: 40,),
          popularSection(),
          SizedBox(height: 40,),
        ],

      ),
    );
  }


  AppBar appBar() {
    return AppBar(
      title: const Text("Breakfast", style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {

        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xfff7f8f8),
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset("assets/icons/left-arrow.svg",
            height: 10,
            width: 10,),
        ),
      ),
      actions: [
        GestureDetector( //for make it clickable
          onTap: () {

          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 37,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xfff7f8f8),
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

  Container searchField() {
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
              child: IntrinsicHeight( //If you want to use divider in row
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

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.separated( //For seperate listview items
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 25,),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
  Column dietSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recomendation\nFor Diet",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          color: Colors.white,
          height: 240,
          child: ListView.separated(
              itemBuilder: (context, index){
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: SvgPicture.asset(diets[index].iconPath)),
                      Text(
                        diets[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        diets[index].level + " | " + diets[index].duration + " | " + diets[index].calorie,
                        style: TextStyle(
                            color: Color(0xff7b6f72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            "View",
                            style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : Color(0xffc58bf2),
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  diets[index].viewIsSelected ? Color(0xff9dceff) : Colors.transparent, //If else statment
                                  diets[index].viewIsSelected ? Color(0xff92a3fd) : Colors.transparent
                                ]
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 25,),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              itemCount: diets.length),
        ),
      ],
    );
  }

  Column popularSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Popular",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        SizedBox(height: 15,),
        ListView.separated(
            shrinkWrap: true, //If it is not true listview will be big as parent, if true list wrap own content and big as childen
            padding: EdgeInsets.only(
                left: 20,
                right: 20
            ),
            itemBuilder: (context, index){
              return Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color : Color(0xff1d1617).withOpacity(0.07),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(popularDiets[index].iconPath,
                      width: 60,
                      height: 60,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularDiets[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        Text(
                          popularDiets[index].level + " | " + popularDiets[index].duration + " | " + popularDiets[index].calorie,
                          style: TextStyle(
                              color: Color(0xff7b6f72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: SvgPicture.asset("assets/icons/button-next.svg",
                        width: 30,
                        height: 30,),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 25,),
            itemCount: popularDiets.length)
      ],
    );
  }
}