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
      {this.firstName = "",
      this.lastName = "",
      this.age = 0,
      this.taille = 0.0,
      this.genre = true,
      this.hobbies = const [],
      this.languageFavorite = "Dart",
      this.secret = ""});

  String setFullName() => "$firstName $lastName";

  String setAge() {
    String ageString = "$age an";
    if (age > 1) {
      ageString += "s";
    }
    return ageString;
  }

  String setTaille() {
    if (taille >= 2) {
      return "${taille.toInt()} cms";
    } else {
      return "${taille.toInt()} cm";
    }
  }

  String setSexe() => genre ? "Féminin" : "Masculin";

  String setHobbies() {
    String toHobbiesString = "";
    if (hobbies.isEmpty) {
      return "Je n'ai pas de hobbies.";
    } else {
      toHobbiesString = "Mes hobbies sont :";
      for (var hobbie in hobbies) {
        toHobbiesString += " $hobbie,";
      }

      return toHobbiesString.replaceRange(
          toHobbiesString.length - 1, null, ".");
    }
  }
}
