import 'package:get/get.dart';
import '../../data/services/auth_service.dart';
import '../../routes/app_routes.dart';



class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    
    // Simulate a short delay for branding (optional)
    await Future.delayed(const Duration(seconds: 2));

    // Check Authentication State
    if (AuthService.to.currentUser.value != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.AUTH);
    }
  }
}

