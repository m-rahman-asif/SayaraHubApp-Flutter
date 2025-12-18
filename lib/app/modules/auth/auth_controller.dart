import 'package:get/get.dart';
import '../../data/services/auth_service.dart';
import '../../routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService.to;

  // New observable variables
  var isRememberMeChecked = false.obs;
  var isPasswordHidden = true.obs;

  void toggleRememberMe(bool? value) {
    isRememberMeChecked.value = value ?? false;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void loginWithGoogle() async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void loginWithFacebook() async {
    final user = await _authService.signInWithFacebook();
    if (user != null) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}