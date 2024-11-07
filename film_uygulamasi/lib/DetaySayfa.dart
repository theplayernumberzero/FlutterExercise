// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:film_uygulamasi/Filmler.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film;
  DetaySayfa({
    Key? key,
    required this.film,
  }) : super(key: key);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_adi),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                height: 350,
                child: Image.asset("resimler/${widget.film.film_resim_adi}")),
              Text("${widget.film.film_fiyat.toInt().toString()} ₺", style: TextStyle(fontSize: 48, color: Colors.white),),
              ElevatedButton(onPressed: (){}, child: Text("SATIN AL"))
            ],
          ),
        ),
      ),
    );
  }
}