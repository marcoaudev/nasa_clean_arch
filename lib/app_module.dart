import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/features/presenter/pages/home_page.dart';
import 'package:nasa_clean_arch/features/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/picture', child: (context) => const PicturePage());
  }
}