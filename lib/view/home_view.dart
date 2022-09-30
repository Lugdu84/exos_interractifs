import 'package:exos_interractifs/view/header.dart';
import 'package:exos_interractifs/view/sub_title.dart';
import 'package:flutter/material.dart';

import '../model/profil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final Profil profil = Profil(
      firstName: "David",
      lastName: "Grammatico",
      age: 49,
      taille: 180,
      genre: true,
      hobbies: ["sport"],
      languageFavorite: "dart",
      secret: "");

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController secret;

  @override
  void initState() {
    super.initState();
    lastName = TextEditingController();
    firstName = TextEditingController();
    secret = TextEditingController();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    secret.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon profil"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Header(profil: profil),
          const Divider(
            thickness: 2,
            color: Colors.purple,
          ),
          const SubTitle(texte: "Modifier les infos"),
          TextField(
            controller: firstName,
            decoration: InputDecoration(hintText: "Entrez votre prénom"),
            onChanged: ((value) {
              setState(() {
                profil.firstName = value;
              });
            }),
          ),
          TextField(
            controller: lastName,
            decoration: InputDecoration(hintText: "Entrez votre nom"),
            onChanged: ((value) {
              setState(() {
                profil.lastName = value;
              });
            }),
          ),
          TextField(
            obscureText: true,
            obscuringCharacter: "*",
            controller: lastName,
            decoration: InputDecoration(hintText: "Dites nous un secret"),
            onChanged: ((value) {
              setState(() {
                profil.secret = value;
              });
            }),
          )
        ],
      )),
    );
  }
}
