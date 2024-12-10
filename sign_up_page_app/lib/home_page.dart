import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String dropdownValue = "+90";

  late var controllerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF7787b2),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              width: width - 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Cep Telefonu",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 22, child: Image.asset("assets/images/turkey.png")),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("+90", style: TextStyle(color: Colors.white)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controllerPhone,
                      maxLength: 10,
                      decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          hintText: "(500) 000 00 00",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Visibility(
              visible: true,
              child: Row(
                children: [
                  Text(
                    "Geçersiz cep telefonu.",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            const Row(),
          ],
        ),
      ),
    );
  }
}
