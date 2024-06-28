import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/controller/phone_controller.dart';
import 'package:phone_auth_assignment/core/utils/colors.dart';
import 'package:phone_auth_assignment/core/utils/images.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';
import 'package:phone_auth_assignment/core/widgets/appbar.dart';
import 'package:phone_auth_assignment/core/widgets/custom_button.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  final controller = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    if(controller.isLoading.value){
      return const CircularProgressIndicator(
        color: AppColors.primary,
        backgroundColor: Colors.white24,
      );
    }
    return
      Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SAppbar(
        showLeadingIcon: true,
        leadingIcon: Icons.close,
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: AppSizes.defaultPadding,
                right: AppSizes.defaultPadding,
                top: AppSizes.maxSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Please enter your mobile number',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.sm),
                const Text(
                  'You\'ll receive a 6 digit code',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey),
                ),
                const Text(
                  'to verify next.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.0, color: Colors.black),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        AppImage.india,
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(
                        width: AppSizes.defaultPadding,
                      ),
                      const Text(
                        '+91',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: AppSizes.defaultPadding,
                      ),
                      const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: AppSizes.defaultPadding,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.phone,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSizes.lg,
                ),
                CustomButton(
                  title: 'CONTINUE',
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    controller.loginWithPhoneNumber();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppImage.bg3,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
