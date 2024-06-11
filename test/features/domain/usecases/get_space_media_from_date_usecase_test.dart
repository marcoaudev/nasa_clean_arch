import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/usecase/errors/failures.dart';
import 'package:nasa_clean_arch/core/usecase/usecase.dart';
import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_arch/features/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_arch/features/domain/usecases/get_space_media_from_date_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaUsecaseFromDate usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUsecaseFromDate(repository);
  });

  const tSpaceMedia = SpaceMediaEntity(
      description: "Eu sou uma descrição",
      mediaType: "image",
      title: "A colorful quadrantid Meteor",
      mediaUrl: "https://apod.nasa.gov/apod/image/2406/LionNeb_Badr_960.jpg");

  final tNoParams = NoParams();

  test("Should get space media from for a given date from the repository", () {
    // when(repository.getSpaceMediaFromDate())
    //     .thenAnswer((_) async => const Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    // final result = usecase(tNoParams);
    // expect(result, const Right(tSpaceMedia));
    // verify(repository.getSpaceMediaFromDate());
  });
}
