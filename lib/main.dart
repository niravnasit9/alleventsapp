import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'controllers/auth_controller.dart';
import 'controllers/api_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Register controllers globally using GetX
  Get.put(AuthController());
  Get.put(ApiController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AllEvents',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signup, // Specify the initial route (e.g., Signup screen)
      getPages: AppRoutes.routes, // Define all routes in your app
    );
  }
}
