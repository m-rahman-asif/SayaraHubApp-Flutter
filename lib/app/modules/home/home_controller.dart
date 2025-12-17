import 'package:get/get.dart';
import '../../data/services/auth_service.dart';
import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  final AuthService _authService = AuthService.to;

  // Access the current user for the UI
  var user = AuthService.to.currentUser;

  void logout() async {
    await _authService.logout();
    Get.offAllNamed(Routes.AUTH);
  }
}