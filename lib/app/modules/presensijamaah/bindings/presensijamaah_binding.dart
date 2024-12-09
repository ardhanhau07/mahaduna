import 'package:get/get.dart';

import '../controllers/presensijamaah_controller.dart';

class PresensijamaahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresensijamaahController>(
      () => PresensijamaahController(),
    );
  }
}
