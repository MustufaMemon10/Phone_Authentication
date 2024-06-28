import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/core/utils/loader/snackbar.dart';
import 'package:phone_auth_assignment/screens/profile_screen.dart';
import 'package:telephony/telephony.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  @override
  void onInit() async {
    super.onInit();
    await requestPermissions();
    startListen();
  }

  @override
  void onClose() {
    super.onClose();
    msgOtp.dispose();
  }

  /// Variable
  final isLoading = false.obs;
  final msgOtp = TextEditingController();
  final Telephony telephony = Telephony.instance;
  String verificationId = '';

  /// Function
  Future<void> requestPermissions() async {
    bool? result = await telephony.requestPhoneAndSmsPermissions;
    if (result == null || !result) {
      // Handle permission denial
      Loaders.errorSnackBar(
          title: 'Permission Denied',
          message: 'SMS permission is required for OTP verification.');
    }
  }
  /// Listens to SMS
  void startListen() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        if (message.body!.contains("phoneauth-ef0b3")) {
          String filteredMsg = message.body!.substring(0, 6);
          msgOtp.text = filteredMsg;
         Future.delayed(const Duration(seconds: 1),(){
           otpVerify();
         }
        );
        }
      },
      listenInBackground: false,
    );
  }
  /// Get verificationId from phoneController

  void setVerificationId(String id) {
    verificationId = id;
  }


  /// Verify OTP from Credential
  Future<void> otpVerify() async {
    try {
      isLoading.value = true;
      if (msgOtp.text.length != 6) {
        Loaders.errorSnackBar(title: 'Invalid OTP');
        isLoading.value = false;
        return;
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: msgOtp.text.trim());
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        Get.offAll(() => ProfileScreen(),
            transition: Transition.rightToLeft);
      });
    } catch (e) {
      isLoading.value = false;
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
