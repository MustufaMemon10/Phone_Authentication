import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/controller/profile_controller.dart';
import 'package:phone_auth_assignment/core/utils/images.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';
import 'package:phone_auth_assignment/core/widgets/appbar.dart';
import 'package:phone_auth_assignment/core/widgets/custom_button.dart';
import 'package:phone_auth_assignment/core/widgets/select_profile.dart';
import 'package:phone_auth_assignment/screens/ConfirmScreen.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SAppbar(),
        body: Padding(
          padding: const EdgeInsets.only(
              left: AppSizes.defaultPadding,
              right: AppSizes.defaultPadding,
              top: AppSizes.maxSize),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Please select your profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                SelectProfileWidget(rValue: 'Shipper',title: 'Shipper',image: AppImage.shipper,),
                const SizedBox(
                  height: AppSizes.lg,
                ),
                SelectProfileWidget(rValue: 'Transporter',title: 'Transporter',image: AppImage.transporter),
                const SizedBox(
                  height: AppSizes.lg,
                ),
                CustomButton( title: 'CONTINUE',onTap: (){
                  if(controller.selectedProfile.isNotEmpty){
                    Get.offAll(()=>  ConfirmationScreen(profile: controller.selectedProfile.value,),transition: Transition.rightToLeft);
                  }
                },),
              ],
            ),
          ),
        ));
  }
}
