import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/usecase/errors/failures.dart';
import 'package:nasa_clean_arch/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_clean_arch/features/presenter/controllers/home_controller.dart';

import '../../../../mocks/date_mock.dart';
import '../../../../mocks/space_media_entity_mock.dart';

class MockGetSpaceMediaUsecaseFromDate extends Mock implements GetSpaceMediaUsecaseFromDate{}
void main() {

  late HomeStore store;
  late GetSpaceMediaUsecaseFromDate mockUsecase;

  setUp((){
    mockUsecase = MockGetSpaceMediaUsecaseFromDate();
    store = HomeStore(mockUsecase);
    registerFallbackValue(DateTime(0,0,0));
  });

  test('Should return a SpaceMediaEntity from the usecase', () async {
    //Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => const Right(spaceMediaMockEntity));
    //Act
    await store.getSpaceMediaFromDate(tDateTime);
    //Assert
    store.observer(
      onState: (state) {
        expect(state, spaceMediaMockEntity);
        verify(() => mockUsecase(tDateTime)).called(1);
      },
    );
  });

  final tFailure = ServerFailure(); 

  test('Should return a Failure from the usecase when there is an error', () async {
    //Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));
    //Act
    await store.getSpaceMediaFromDate(tDateTime);
    //Assert
    store.observer(
      onError: (error) {
        expect(error, tFailure);
        verify(() => mockUsecase(tDateTime)).called(1);
      },
    );
  });
}