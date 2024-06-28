import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/controller/otp_controller.dart';
import 'package:phone_auth_assignment/core/utils/loader/snackbar.dart';
import 'package:phone_auth_assignment/screens/Verify_Phone.dart';
import 'package:phone_auth_assignment/screens/language_screen.dart';

class PhoneController extends GetxController {
  static PhoneController get instance => Get.find();

  // variables
  final isLoading = false.obs;
  final phone = TextEditingController();
  GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  final controller = Get.put(OtpController());
  final _auth = FirebaseAuth.instance;

  /// Functions
  Future<void> loginWithPhoneNumber() async {
    try {
      isLoading.value == true;
      if (phone.text.isEmpty) {
        Loaders.errorSnackBar(
            title: 'Phone number is required',
            message: 'Provide your phone number to login',
            color: Colors.orange);
        isLoading.value == false;
        return;
      }
      final phoneRegExp = RegExp(r'^\d{10}$');
      if (!phoneRegExp.hasMatch(phone.text)) {
        Loaders.errorSnackBar(
            title: 'Invalid Phone Number',
            message: 'Please provide valid phone number to login',
            color: Colors.orange);
        isLoading.value == false;
        return;
      } else {
        _auth.verifyPhoneNumber(
          phoneNumber: '+91${phone.text.toString()}',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {
            isLoading.value == false;
            Loaders.errorSnackBar(
                title: 'Verification Failed', message: 'Unknown error');
          },
          codeSent: (String verificationId, int? resendtoken) {
            controller.setVerificationId(verificationId);
            Get.to(
                () => VerifyScreen(
                      phoneNumber: phone.text.trim(),
                    ),
                transition: Transition.rightToLeft);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value == false;
    }
  }

}
