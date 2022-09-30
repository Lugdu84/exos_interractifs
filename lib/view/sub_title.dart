import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String texte;
  const SubTitle({Key? key, required this.texte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: const TextStyle(
          fontSize: 18,
          color: Colors.purpleAccent,
          fontWeight: FontWeight.bold),
    );
  }
}
