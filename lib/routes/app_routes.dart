import 'package:alleventsapp/auth_screens/login.dart';
import 'package:alleventsapp/auth_screens/sign_up.dart';
import 'package:alleventsapp/main_ui.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String signup = '/signup';
  static const String login = '/login';
  static const String main = '/main';

  static final routes = [
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: main, page: () => MainPage()),
  ];
}
