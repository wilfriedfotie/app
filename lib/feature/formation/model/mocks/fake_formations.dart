import 'dart:math';

import '../response/formation_model_response.dart';

List<FormationModelResponse> fakeFormations = List.generate(20, (index) {
  var randomRating = (Random().nextDouble() * 5 * 10).floor() / 10;
  return FormationModelResponse(
    id: index + 1,
    image: 'assets/images/formation.png',
    name: 'Formation ${index + 1}',
    rating: randomRating,
    // Generating random rating between 0 and 5
    price: Random().nextInt(1000), // Generating random price between 0 and 1000
  );
});
