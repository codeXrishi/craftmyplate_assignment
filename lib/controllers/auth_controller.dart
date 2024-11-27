import 'package:craftmyplate/screens/auth/login.dart';
import 'package:craftmyplate/screens/event_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observables for state management
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isSignedIn = false.obs;

  var user = Rx<User?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user.bindStream(_auth.authStateChanges());

    // Check if user is already logged in
    if (_auth.currentUser != null) {
      isSignedIn.value = true;
      // Navigate to the home screen if the user is signed in
      Future.delayed(Duration.zero, () => Get.offAll(EventScreen()));
    }
  }

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register method
  Future<void> register(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Registration successful');
      Get.offAll(
          EventScreen()); // Navigate to home screen after successful registration
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Login method
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'Login successful');
      Get.offAll(EventScreen(),
          transition: Transition
              .fadeIn); // Navigate to home screen after successful login
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
    Get.snackbar('Logged out', 'Successfully logged out');
    Get.offAll(const Login()); // Navigate to login screen
  }
}
