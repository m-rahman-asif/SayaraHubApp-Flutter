import 'package:get/get.dart';
import '../../data/services/auth_service.dart';
import '../../routes/app_routes.dart';



class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
  
    await Future.delayed(const Duration(seconds: 2));

  
    if (AuthService.to.currentUser.value != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.AUTH);
    }
  }
}

