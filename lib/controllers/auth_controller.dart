import 'package:alleventsapp/auth_screens/login.dart';
import 'package:alleventsapp/main_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';



class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);

  /// Sign up with email and password
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Signup successful! Redirecting to login.");
      Get.off(const LoginScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Login with email and password
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.off(MainPage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Sign in with Google

  googleSignInMethod() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    try {
      GoogleSignInAuthentication googleAuth =
      await googleSignInAccount!.authentication;

      GoogleAuthCredential? credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken) as GoogleAuthCredential?;

      UserCredential signedInCredentials =
      await _auth.signInWithCredential(credential!);
      User? tempUser = signedInCredentials.user;
      /*_sessionManager.saveString(Constants.User_ID, tempUser!.uid);*/
      print("Name : " + tempUser!.displayName.toString());
      print("Email : " + tempUser.email.toString());
      print("PhotoUrl : " + tempUser.photoURL.toString());
      print("User Details : " + tempUser.toString());

      Get.off(MainPage());
        } catch (e) {
      print("Error Message : " + e.toString());
    }
  }


}
