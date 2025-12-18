import 'package:get/get.dart';
import 'notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    // This keeps the controller in memory during the entire session
    Get.put<NotificationsController>(NotificationsController(), permanent: true);
  }
}