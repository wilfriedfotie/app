import 'package:LASYLAB/core/components/images.dart';

class HomeCourseItems {
  final String courseName;
  final String image;
  final double progression;
  HomeCourseItems({
    required this.courseName,
    required this.image,
    required this.progression,
  });
}

List<HomeCourseItems> courseData = [
  HomeCourseItems(
      courseName: "Mathématiques",
      image: "assets/images/maths_icon.png",
      progression: 0),
  HomeCourseItems(
      courseName: "Français", image: "assets/images/Book.png", progression: 0),
  HomeCourseItems(
      courseName: "SVT", image: "assets/images/Bocal.png", progression: 0),
  HomeCourseItems(
      courseName: "Philosophie", image: Images.philosophy_icon, progression: 0),
  HomeCourseItems(
      courseName: "Informatique",
      image: "assets/images/computer.png",
      progression: 0),
  HomeCourseItems(
      courseName: "Anglais",
      image: "assets/images/English.png",
      progression: 0),
];
