import 'package:flutter/material.dart';

import '../model/profil.dart';

class Header extends StatelessWidget {
  final Profil profil;
  const Header({Key? key, required this.profil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            width: width,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Text(profil.setFullName()),
                Text("Age : ${profil.setAge()}"),
                Text("Taille : ${profil.setTaille()}"),
                Text("Genre : ${profil.setSexe()}"),
                Text("Hobbies : "),
                Text(
                    "Language de programmation préféré : ${profil.languageFavorite}"),
                ElevatedButton(onPressed: null, child: Text("Montrer secret")),
                Text("secret ...")
              ],
            )));
  }
}
