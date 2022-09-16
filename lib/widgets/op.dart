import 'package:flutter/material.dart';

class OpWidget extends StatelessWidget {
  const OpWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 40,
        ));
  }
}