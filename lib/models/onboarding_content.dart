class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Bienvenue sur\nlasylab !',
      image: 'assets/svg/playing.svg',
      description:
          "La nouvelle solution pour\nréviser tous tes cours tous les jours."),
  UnbordingContent(
      title: 'Apprendre',
      image: 'assets/svg/sit_reading.svg',
      description:
          "Grâce aux activités et quiz\n progresser dans apprentissage  "),
  UnbordingContent(
      title: 'Réviser',
      image: 'assets/svg/challenge.svg',
      description:
          "Des fiches de cours et vidéo et\n de révision à ta dispo dans\n toutes les matières"),
  UnbordingContent(
      title: 'Comprendre',
      image: 'assets/svg/playing.svg',
      description: "Pose toutes tes questions à tout\n moment aux profs"),
];
