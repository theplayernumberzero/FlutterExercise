import 'package:enum_example1/enum_examples.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color isikRengi(TrafikLambasi lamba) {
    switch (lamba) {
      case TrafikLambasi.Kirmizi:
        return Colors.red;
      case TrafikLambasi.Sari:
        return Colors.yellow;
      case TrafikLambasi.Yesil:
        return Colors.green;
    }
  }

  String isikAdi(TrafikLambasi lamba) {
    switch (lamba) {
      case TrafikLambasi.Kirmizi:
        return "Kirmizi Isik";
      case TrafikLambasi.Sari:
        return "Sari Isik";
      case TrafikLambasi.Yesil:
        return "Yesil Isik";
    }
  }

  var lamba = TrafikLambasi.Kirmizi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Enum Example"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lamba = TrafikLambasi.Kirmizi;
                      });
                    },
                    child: const Text("Kirmizi Isik")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lamba = TrafikLambasi.Sari;
                      });
                    },
                    child: const Text("Sari Isik")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lamba = TrafikLambasi.Yesil;
                      });
                    },
                    child: const Text("Yesil Isik")),
              ],
            ),
            Container(
                height: 150, width: 150, decoration: BoxDecoration(color: isikRengi(lamba), shape: BoxShape.circle)),
            Text(isikAdi(lamba)),
          ],
        ),
      ),
    );
  }
}
