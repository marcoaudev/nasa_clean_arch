import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

abstract interface class ISpaceMediaDatasource{
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}