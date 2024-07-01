import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:nasa_clean_arch/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_arch/features/presenter/controllers/home_controller.dart';
import 'package:nasa_clean_arch/features/presenter/widgets/custom_video_player.dart';
import 'package:nasa_clean_arch/features/presenter/widgets/description_bottom_sheet.dart';
import 'package:nasa_clean_arch/features/presenter/widgets/image_network_with_loader.dart';
import 'package:nasa_clean_arch/features/presenter/widgets/page_slider_up.dart';

class PicturePage extends StatefulWidget {
  final DateTime? dateSelected;

  const PicturePage({
    super.key,
    this.dateSelected,
  });


  static void navigate(DateTime? dateSelected) {
    Modular.to.pushNamed(
      '/picture',
      arguments: {'dateSelected': dateSelected},
    );
  }

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends ModularState<PicturePage, HomeStore> {
  @override
  void initState() {
    store.getSpaceMediaFromDate(widget.dateSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScopedBuilder(
        store: store,
        onLoading: (context) => const Center(child: CircularProgressIndicator()),
        onError: (context, error) => const Center(
          child: Text(
            'An error occurred, try again later.',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onState: (context, SpaceMediaEntity spaceMedia) {
          return PageSliderUp(
            onSlideUp: () => showDescriptionBottomSheet(
              context: context,
              title: spaceMedia.title,
              description: spaceMedia.description,
            ),
            child: spaceMedia.mediaType == 'video' && spaceMedia.mediaUrl != null
                ? CustomVideoPlayer(spaceMedia)
                : spaceMedia.mediaType == 'image' && spaceMedia.mediaUrl != null
                    ? ImageNetworkWithLoader(spaceMedia.mediaUrl)
                    : Container(),
          );
        },
      ),
    );
  }
}