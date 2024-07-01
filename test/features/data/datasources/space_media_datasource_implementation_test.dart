import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/usecase/errors/exceptions.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

import '../../../../mocks/date_mock.dart';
import '../../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late IHttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = SpaceMediaDatasourceImplemetation(client);
  });

  const urlExpected =
      "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-02-02";

  void successMock() {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    when(() => client.get(any()))
        .thenAnswer((_) async => HttpResponse(data: jsonMap, statusCode: 200));
  }

  test('should call the get method with correct url', () async {
    //Arrange
    successMock();
    //Act
    await datasource.getSpaceMediaFromDate(tDateTime);
    //Assert
    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is successful', () async {
    //Arrange
    successMock();
    const tSpaceMediaModelExpected = SpaceMediaModel(
      description:
          "Why is the sky near Antares and Rho Ophiuchi so colorful, yet dusty?  The colors result from a mixture of objects and processes.  Fine dust -- illuminated by starlight -- produces blue reflection nebulae. Gaseous clouds whose atoms are excited by ultraviolet starlight produce reddish emission nebulae. Backlit dust clouds block starlight and so appear dark.   Antares, a red supergiant and one of the brighter stars in the night sky, lights up the yellow-red clouds on the upper right of the featured image. The Rho Ophiuchi star system lies at the center of the blue reflection nebula on the left, while a different reflection nebula, IC 4605, lies just below and right of the image center.  These star clouds are even more colorful than humans can see, emitting light across the electromagnetic spectrum.   Open Science: Browse 3,400+ codes in the Astrophysics Source Code Library",
      mediaType: "image",
      title: "A colorful quadrantid Meteor",
      mediaUrl: "https://apod.nasa.gov/apod/image/2406/LionNeb_Badr_960.jpg",
    ); 
    //Act
    final result = await datasource.getSpaceMediaFromDate(tDateTime);
    //Assert
    expect(result, tSpaceMediaModelExpected);
  });
  test('should throw a ServerException when the call is unccessful', () async {
    //Arrange
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: 'something went wrong', statusCode: 400));
    //Act
    final result = datasource.getSpaceMediaFromDate(tDateTime);
    //Assert
    expect(() => result, throwsA(ServerException()));
  });
}
