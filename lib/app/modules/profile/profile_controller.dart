import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sayara_hub/app/data/services/auth_service.dart';

class ProfileController extends GetxController {
  final _auth = FirebaseAuth.instance;
 
  final GoogleSignIn _googleSignIn = GoogleSignIn(); 

  final box = GetStorage(); 

  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var photoUrl = "".obs;
  var isNotifEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    isNotifEnabled.value = box.read('notif_on') ?? true;
  }

  void fetchUserData() {
    User? user = _auth.currentUser;
    if (user != null) {
      name.value = user.displayName ?? "User";
      email.value = user.email ?? "";
      phone.value = user.phoneNumber ?? "";
      photoUrl.value = user.photoURL ?? "";
    }
  }

  void toggleNotifications(bool val) {
    isNotifEnabled.value = val;
    box.write('notif_on', val);
  }

  
  Future<void> logout() async {
  try {
   
    await AuthService.to.logout(); 
    
  
    Get.offAllNamed('/auth'); 
  } catch (e) {
   
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/auth');
    Get.snackbar("Logout", "You have been signed out.");
  }
}
}