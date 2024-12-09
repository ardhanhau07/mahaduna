import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/informasi/controllers/informasi_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   Get.put(InformasiController()); // Daftarkan controller
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: "Ma'haduna",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
