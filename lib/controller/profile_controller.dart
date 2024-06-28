import 'package:get/get.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  // Variables
  final selectedProfile = ''.obs;

  // Functions
  void changeProfile(value) {
    selectedProfile.value = value;
    print(selectedProfile);

  }
}