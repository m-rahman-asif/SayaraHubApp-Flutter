// lib/app/modules/notifications/notifications_controller.dart
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  // Define the observable list to fix the 'undefined' error
  final RxList<Map<String, String>> notifications = <Map<String, String>>[
    {
      'title': 'Bookings Alerts',
      'body': 'Good news! Anil Kumar just booked your Convo.',
      'time': '2h ago'
    },
    {
      'title': 'Reminder',
      'body': 'Tomorrow is your Convo!',
      'time': '1h ago'
    },
    {
      'title': 'New Feature Alert!',
      'body': 'A new version of the app is available!',
      'time': '5h ago'
    },
  ].obs;

  void removeNotification(int index) {
    notifications.removeAt(index);
  }
}