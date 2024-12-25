import 'package:custom_widget/widgets/buttons.dart';
import 'package:custom_widget/widgets/textformfield_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reusable Widget"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Welcome Back Again!",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldComponent(
                hintText: "Username",
                textInputType: TextInputType.name,
                obscureText: false,
                controller: usernameController),
            TextFormFieldComponent(
                hintText: "Password",
                textInputType: TextInputType.name,
                obscureText: true,
                controller: passwordController),
            const SizedBox(
              height: 30,
            ),
            ButtonComponent(
                buttonText: "Login",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                callback: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Succesfully logged in!")));
                }),
            const SizedBox(
              height: 30,
            ),
            ButtonComponent(
                buttonText: "Sign Up",
                textColor: Colors.white,
                buttonColor: Colors.red,
                callback: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign Up Page!")));
                }),
          ],
        ),
      ),
    );
  }
}
