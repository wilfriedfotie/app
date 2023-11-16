class ProfileItem {
  final String title;
  final Function onPressed;
  ProfileItem({required this.title, required this.onPressed});
}

List<ProfileItem> data = [
  ProfileItem(title: "Informations personnelles", onPressed: () {}),
  ProfileItem(title: "statistique évolution", onPressed: () {}),
  ProfileItem(title: "Ma classe", onPressed: () {}),
  ProfileItem(title: "Mon biographie", onPressed: () {}),
  ProfileItem(title: "Mot de passe", onPressed: () {}),
  ProfileItem(title: "Mon parent", onPressed: () {}),
  ProfileItem(title: "Ecole", onPressed: () {}),
  ProfileItem(title: "À propos de nous", onPressed: () {}),
];
