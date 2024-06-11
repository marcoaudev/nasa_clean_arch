import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';

import '../../../../mocks/space_media_mock.dart';

void main() {
  const tSpaceMediaModel = SpaceMediaModel(
    description:
        "Why is the sky near Antares and Rho Ophiuchi so colorful, yet dusty?  The colors result from a mixture of objects and processes.  Fine dust -- illuminated by starlight -- produces blue reflection nebulae. Gaseous clouds whose atoms are excited by ultraviolet starlight produce reddish emission nebulae. Backlit dust clouds block starlight and so appear dark.   Antares, a red supergiant and one of the brighter stars in the night sky, lights up the yellow-red clouds on the upper right of the featured image. The Rho Ophiuchi star system lies at the center of the blue reflection nebula on the left, while a different reflection nebula, IC 4605, lies just below and right of the image center.  These star clouds are even more colorful than humans can see, emitting light across the electromagnetic spectrum.   Open Science: Browse 3,400+ codes in the Astrophysics Source Code Library",
    mediaType: "image",
    title: "A colorful quadrantid Meteor",
    mediaUrl: "https://apod.nasa.gov/apod/image/2406/LionNeb_Badr_960.jpg",
  );
  test('Should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test("Should return a valid model", () {
    //Arrange
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    //Act
    final result = SpaceMediaModel.fromJson(jsonMap);
    //Assert
    expect(result, tSpaceMediaModel);
  });

  test("Should return a json map containing the proper data", () {
    //Arrange
    final expectedMap = {
      "explanation": "Why is the sky near Antares and Rho Ophiuchi so colorful, yet dusty?  The colors result from a mixture of objects and processes.  Fine dust -- illuminated by starlight -- produces blue reflection nebulae. Gaseous clouds whose atoms are excited by ultraviolet starlight produce reddish emission nebulae. Backlit dust clouds block starlight and so appear dark.   Antares, a red supergiant and one of the brighter stars in the night sky, lights up the yellow-red clouds on the upper right of the featured image. The Rho Ophiuchi star system lies at the center of the blue reflection nebula on the left, while a different reflection nebula, IC 4605, lies just below and right of the image center.  These star clouds are even more colorful than humans can see, emitting light across the electromagnetic spectrum.   Open Science: Browse 3,400+ codes in the Astrophysics Source Code Library",
      "media_type": "image",
      "title": "A colorful quadrantid Meteor",
      "url": "https://apod.nasa.gov/apod/image/2406/LionNeb_Badr_960.jpg"
    };
    //Act
    final result = tSpaceMediaModel.toJson();
    //Assert
    expect(result, expectedMap);
  });
}
