import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Register",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: SizedBox(
            width: 200,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: SizedBox(
            width: 200,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => {print("dd")},
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black, shape: const BeveledRectangleBorder()),
                  child: const Text("Register"))),
        ),
        const TextButton(
            onPressed: null,
            child: Text(
              "Already have an account?",
              style: TextStyle(color: Colors.blueAccent),
            ))
      ],
    )));
  }
}
