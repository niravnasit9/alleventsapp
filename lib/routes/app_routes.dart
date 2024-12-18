import 'package:alleventsapp/auth_screens/login.dart';
import 'package:alleventsapp/auth_screens/sign_up.dart';
import 'package:alleventsapp/main_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String signup = '/signup';
  static const String login = '/login';
  static const String main = '/main';

  static final routes = [
    GetPage(name: signup, page: () => const SignUpScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: main, page: () => MainPage()),
  ];
}
