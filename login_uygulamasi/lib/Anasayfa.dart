import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kullanici Adi:\n",
              style: TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Font weight
                color: Colors.green, // Text color
                letterSpacing: 2.0, // Spacing between letters
                wordSpacing: 4.0, // Spacing between words
                fontFamily: 'Roboto', // Font family 
                shadows: [
                  Shadow(
                    blurRadius: 5.0, // Blur radius of shadow
                    color: Colors.black, // Shadow color
                    offset: Offset(2.0, 2.0), // Shadow offset
                  ),
                ],
              ),
              textAlign:
                  TextAlign.center, // Text alignment (left, center, right)
            ),
            Text(
              "Şifre:\n",
              style: TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Font weight
                color: Colors.green, // Text color
                letterSpacing: 2.0, // Spacing between letters
                wordSpacing: 4.0, // Spacing between words
                fontFamily: 'Roboto', // Font family 
                shadows: [
                  Shadow(
                    blurRadius: 5.0, // Blur radius of shadow
                    color: Colors.black, // Shadow color
                    offset: Offset(2.0, 2.0), // Shadow offset
                  ),
                ],
              ),
              textAlign:
                  TextAlign.center, // Text alignment (left, center, right)
            ),
          ],
        ),
      ),
    );
  }
}
