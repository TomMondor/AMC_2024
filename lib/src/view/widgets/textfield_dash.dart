import 'package:flutter/material.dart';

class TextfieldDash extends StatelessWidget {
  final String title;

  const TextfieldDash({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        TextFormField(
            style: const TextStyle(
                color: Colors.indigo, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            )),
      ],
    );
  }
}
