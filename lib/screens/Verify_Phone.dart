import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_auth_assignment/controller/otp_controller.dart';
import 'package:phone_auth_assignment/controller/phone_controller.dart';
import 'package:phone_auth_assignment/core/utils/colors.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';
import 'package:phone_auth_assignment/core/widgets/appbar.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  final String phoneNumber;

  VerifyScreen({super.key, required this.phoneNumber});

  final controller = Get.put(PhoneController());
  final otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: AppColors.fieldColor,
      ),
    );
   return Obx(() {
     if (otpController.isLoading.value) {
       return const CircularProgressIndicator(
         color: AppColors.primary,
         backgroundColor: Colors.white24,
       );
     }
     return Scaffold(
         resizeToAvoidBottomInset: false,
         appBar: const SAppbar(
           leadingIcon: Icons.arrow_back,
           showLeadingIcon: true,
         ),
         body: Padding(
           padding:
           const EdgeInsets.only(left: 11, right: 11, top: AppSizes.maxSize),
           child: Center(
             child: Column(children: [
               const Text(
                 'Verify Phone',
                 style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               const SizedBox(height: AppSizes.sm),
               Text(
                 'Code is sent to $phoneNumber',
                 style: const TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                     color: AppColors.lightGrey),
               ),
               const SizedBox(
                 height: 36,
               ),
               Pinput(
                 controller: otpController.msgOtp,
                 length: 6,
                 defaultPinTheme: defaultPinTheme,
                 closeKeyboardWhenCompleted: true,
                 validator: (value) {
                   if (value!.isEmpty) {
                     return 'OtpField is empty';
                   }
                   return null;
                 },
                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
               ),
               const SizedBox(
                 height: AppSizes.defaultPadding,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text(
                     'Didn\'t receive the code?',
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w400,
                         letterSpacing: 0.7,
                         color: AppColors.lightGrey),
                   ),
                   TextButton(
                       onPressed: () => controller.loginWithPhoneNumber(),
                       child: const Text(
                         'Request Again',
                         style: TextStyle(
                             letterSpacing: 0.7,
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                             color: AppColors.primary),
                       ))
                 ],
               ),
               const SizedBox(height: AppSizes.lg),
               SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(
                           vertical: AppSizes.btnPadding),
                     ),
                     onPressed: () {
                       FocusScope.of(context).unfocus();
                       otpController.otpVerify();
                     },
                     child: Text('VERIFY AND CONTINUE',
                         style: GoogleFonts.montserrat(
                           fontSize: 16,
                           fontWeight: FontWeight.w700,
                           color: Colors.white,
                         )),
                   ))
             ]),
           ),
         ));
   });
  }
}
