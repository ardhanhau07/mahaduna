// app_routes.dart
part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const PRESENSI = _Paths.PRESENSI;
  static const IZIN = _Paths.IZIN;
  static const PRESENSIJAMAAH = _Paths.PRESENSIJAMAAH;
  static const INFORMASI = _Paths.INFORMASI;
}

abstract class _Paths {
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const PRESENSI = '/presensi';
  static const IZIN = '/izin';
  static const PRESENSIJAMAAH = '/presensijamaah';
  static const INFORMASI = '/informasi';
}
