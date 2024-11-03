import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ilham Ver"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ekranYuksekligi/100, bottom: ekranYuksekligi/100),
            child: SizedBox(
              width: ekranGenisligi/4,  //resmin en boy oranı 1 oldugu için yuksekligi belirtmeye gerek yok
              child: Image.asset("resimler/stevejobs.png")),
          ),
          Text("Steve Jobs", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: ekranGenisligi/25),),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: ekranYuksekligi/80,right: ekranYuksekligi/80),
            child: Text("Dünyayı değiştirebileceklerini düşünecek kadar çılgın olan insanlar, bunu yapan insanlardır.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ekranGenisligi/25,
            ),),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: ekranYuksekligi/100),
            child: SizedBox(
              width: ekranGenisligi/2,
              height: ekranYuksekligi/15,
              child: ElevatedButton(
                onPressed: () => print("Ilham verildi.."),
                 child: Text("ILHAM VER", style: TextStyle(fontSize: ekranGenisligi/25),),
                 ),
            ),
          ),
        ],
      ),
    );
  }
}
