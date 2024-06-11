import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  const SpaceMediaModel({
    required super.description,
    required super.mediaType,
    required super.title,
    required super.mediaUrl,
  });

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) {
    return SpaceMediaModel(
      description: json['explanation'],
      mediaType: json['media_type'],
      title: json['title'],
      mediaUrl: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'explanation': description,
        'media_type': mediaType,
        'title': title,
        'url': mediaUrl,
      };
}
