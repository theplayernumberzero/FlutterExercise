import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.red;

  void changeBackgroundColor(Color color) {
    setState(() {
      _color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        backgroundColor: _color,
        title: Text("Colors Demos"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: _color, onTap: _colorOnTop, items: [
        BottomNavigationBarItem(
            icon: _bottomNavBarContainer(
              color: Colors.red,
            ),
            label: "Red"),
        BottomNavigationBarItem(
            icon: _bottomNavBarContainer(
              color: Colors.yellow,
            ),
            label: "Yellow"),
        BottomNavigationBarItem(
            icon: _bottomNavBarContainer(
              color: Colors.green,
            ),
            label: "Green"),
      ]),
    );
  }

  void _colorOnTop(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.green.index) {
      changeBackgroundColor(Colors.green);
    }
  }
}

enum _MyColors { red, yellow, green }

class _bottomNavBarContainer extends StatelessWidget {
  const _bottomNavBarContainer({
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, border: Border.all(width: 2)),
    );
  }
}
