class Profil {
  String firstName;
  String lastName;
  int age;
  double taille;
  bool genre;
  List<String> hobbies;
  String languageFavorite;
  String secret;

  Profil(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.taille,
      required this.genre,
      required this.hobbies,
      required this.languageFavorite,
      required this.secret});

  String setFullName() {
    return "$firstName $lastName";
  }

  String setAge() {
    if (age > 1) {
      return "$age ans";
    } else {
      return "$age an";
    }
  }

  String setTaille() {
    if (taille >= 2) {
      return "${taille.toInt()} cms";
    } else {
      return "${taille.toInt()} cm";
    }
  }

  String setSexe() {
    return genre ? "Masculin" : "Féminin";
  }
}
