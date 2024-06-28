import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/controller/profile_controller.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';
import 'package:phone_auth_assignment/core/widgets/custom_button.dart';
import 'package:phone_auth_assignment/services/auth/Authentication.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({super.key, required this.profile});

  final String? profile;
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_box_outlined,
              size: 40,
              color: Colors.green,
            ),
            const SizedBox(
              height: AppSizes.mdSmall,
            ),
            Text(
              'Welcome Back,$profile',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8),
            ),
            const SizedBox(
              height: AppSizes.maxSize ,
            ),
            CustomButton(
              title: 'Logout',
              onTap: () => Authentication.logout(),
            )
          ],
        ),
      ),
    );
  }
}
