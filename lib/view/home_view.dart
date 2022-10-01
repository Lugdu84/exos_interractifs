import 'package:exos_interractifs/view/sub_title.dart';
import 'package:flutter/material.dart';
import '../model/profil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  Profil profil = Profil(firstName: "David", lastName: "Grammatico");

  bool showSecret = false;
  Map<String, bool> hobbies = {
    "Pétanque": false,
    "Football": false,
    "Rugby": false,
    "Code": false,
    "Manga": false,
    "Cinéma": false
  };
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController secret;

  @override
  void initState() {
    super.initState();
    lastName = TextEditingController();
    firstName = TextEditingController();
    secret = TextEditingController();
    secret.text = profil.secret;
    firstName.text = profil.firstName;
    lastName.text = profil.lastName;
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon profil"),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width,
            child: Card(
              color: Colors.purple.withOpacity(0.5),
              child: Column(
                children: [
                  Text(profil.setFullName()),
                  Text("Age : ${profil.setAge()}"),
                  Text("Taille : ${profil.setTaille()}"),
                  Text("Genre : ${profil.setSexe()}"),
                  Text(profil.setHobbies()),
                  Text(
                      "Language de programmation préféré : ${profil.languageFavorite}"),
                  ElevatedButton(
                      onPressed: showTheSecret,
                      child: Text(
                          showSecret ? "Cacher le secret" : "Montrer secret")),
                  (showSecret)
                      ? Text(profil.secret.isNotEmpty
                          ? "Mon secret est : ${profil.secret}"
                          : "Je n'ai pas de secret")
                      : Container(),
                ],
              ),
            ),
          ),
          myDivider(),
          const SubTitle(texte: "Modifier les infos"),
          myTextField(controller: firstName, hint: "Entrez votre prénom"),
          myTextField(controller: lastName, hint: "Entrez votre nom"),
          myTextField(
              controller: secret,
              hint: "Quel est votre secret ?",
              isSecret: true),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Genre : ${profil.setSexe()}"),
              Switch(
                  value: profil.genre,
                  onChanged: ((bool) {
                    setState(() {
                      profil.genre = bool;
                    });
                  }))
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Taille : ${profil.setTaille()}"),
              Slider(
                  value: profil.taille,
                  min: 0,
                  max: 230,
                  onChanged: ((newValue) {
                    setState(() {
                      profil.taille = newValue;
                    });
                  }))
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Age : ${profil.setAge()}"),
              Slider(
                  value: profil.age.toDouble(),
                  min: 0,
                  max: 120,
                  onChanged: ((newValue) {
                    setState(() {
                      profil.age = newValue.toInt();
                    });
                  }))
            ],
          ),
          myDivider(),
          const SubTitle(texte: "Mes hobbies"),
          myHobbyes(),
          myDivider(),
          const SubTitle(texte: "Mon language préféré")
        ],
      )),
    );
  }

  showTheSecret() {
    setState(() {
      showSecret = !showSecret;
    });
  }

  TextField myTextField(
      {required TextEditingController controller,
      required String hint,
      bool isSecret = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
      obscureText: isSecret,
      onSubmitted: ((newValue) {
        setState(() {
          updateUser();
        });
      }),
    );
  }

  updateUser() {
    setState(() {
      profil.firstName = firstName.text;
      profil.lastName = lastName.text;
      profil.secret = secret.text;
    });
  }

  Column myHobbyes() {
    List<Widget> children = [];
    hobbies.forEach((hobby, checked) {
      Row myHobby = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobby),
          Checkbox(
              value: checked,
              onChanged: (newBool) {
                setState(() {
                  hobbies[hobby] = newBool ?? false;
                  List<String> str = [];
                  hobbies.forEach((key, value) {
                    if (value == true) {
                      str.add(key);
                    }
                  });
                  profil.hobbies = str;
                });
              })
        ],
      );
      children.add(myHobby);
    });
    return Column(
      children: children,
    );
  }

  Divider myDivider() {
    return const Divider(
      thickness: 2,
      color: Colors.purple,
    );
  }

  Column myRadios() {
    List<Widget> widgets = [];
    return Column();
  }
}
