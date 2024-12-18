import 'package:alleventsapp/auth_screens/login.dart';
import 'package:alleventsapp/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(height: TSpaces.defaultSpace),

                /// SignUp Form
                Form(
                  key: authController.formKey,
                  child: Column(
                    children: [
                      /// Username
                      TextFormField(
                        controller: authController.usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: authController.validateUsername,
                      ),
                      const SizedBox(height: TSpaces.spaceBtwTextFormFields),

                      /// Email
                      TextFormField(
                        controller: authController.emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: authController.validateEmail,
                      ),
                      const SizedBox(height: TSpaces.spaceBtwTextFormFields),

                      /// Password
                      Obx(() => TextFormField(
                        controller: authController.passwordController,
                        obscureText: authController.obscurePassword.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              authController.obscurePassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              authController.obscurePassword.toggle();
                            },
                          ),
                        ),
                        validator: authController.validatePassword,
                      )),
                      const SizedBox(height: TSpaces.spaceBtwTextFormFields),

                      /// Confirm Password
                      Obx(() => TextFormField(
                        controller: authController.confirmPasswordController,
                        obscureText: authController.obscureConfirmPassword.value,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              authController.obscureConfirmPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              authController.obscureConfirmPassword.toggle();
                            },
                          ),
                        ),
                        validator: authController.validateConfirmPassword,
                      )),

                      /// Login Redirect Button
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () => Get.to(const LoginScreen()),
                          child: const Text(
                            "Already have an account? Login here",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSpaces.defaultSpace),

                      /// Signup Button
                      Obx(() => authController.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.black,)
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: authController.signUp,
                        child: const Text("Sign Up",
                            style: TextStyle(
                                fontSize: 18, color: Colors.white)),
                      )),
                      const SizedBox(height: TSpaces.defaultSpace),

                      /// Google Sign-In Button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: authController.googleSignInMethod,
                        icon: const Icon(Icons.login, color: Colors.white),
                        label: const Text(
                          "Sign in with Google",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
