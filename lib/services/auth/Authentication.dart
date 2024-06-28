import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/utils/loader/snackbar.dart';
import '../../screens/language_screen.dart';

class Authentication {

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LanguageScreen());
    } on FirebaseAuthException catch (e) {
      throw (e.code.toString());
    } on FirebaseException catch (e) {
      throw (e.code.toString());
    } on FormatException catch (e) {
      throw (e.toString());
    } on PlatformException catch (e) {
      throw (e.code.toString());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}