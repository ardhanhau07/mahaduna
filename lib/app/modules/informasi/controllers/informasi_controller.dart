// controllers/informasi_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InformasiController extends GetxController {
  var mabna = "".obs;
  var lantai = "".obs;
  var pickedImage = Rx<XFile?>(null);

  void updateMabna(String? newMabna) {
    mabna.value = newMabna ?? "";
  }

  void updateLantai(String? newLantai) {
    lantai.value = newLantai ?? "";
  }

  Future<void> ambilGambar() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    this.pickedImage.value = pickedImage;
  }
}
