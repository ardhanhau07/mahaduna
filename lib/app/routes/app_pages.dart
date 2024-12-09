import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informasi/bindings/informasi_binding.dart';
import '../modules/informasi/views/informasi_view.dart';
import '../modules/izin/bindings/izin_binding.dart';
import '../modules/izin/views/izin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/presensi/bindings/presensi_binding.dart';
import '../modules/presensi/views/presensi_view.dart';
import '../modules/presensijamaah/bindings/presensijamaah_binding.dart';
import '../modules/presensijamaah/views/presensijamaah_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRESENSI,
      page: () => const PresensiView(),
      binding: PresensiBinding(),
    ),
    GetPage(
      name: _Paths.IZIN,
      page: () => const IzinView(),
      binding: IzinBinding(),
    ),
    GetPage(
      name: _Paths.PRESENSIJAMAAH,
      page: () => const PresensijamaahView(),
      binding: PresensijamaahBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI,
      page: () => InformasiView(),
      binding: InformasiBinding(),
    ),
  ];
}
