
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/controller/profile_controller.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';

import '../utils/colors.dart';

class SelectProfileWidget extends StatelessWidget {
   SelectProfileWidget({
    super.key,
    required this.rValue, required this.title, required this.image,
  });


  final controller = Get.put(ProfileController());

  final String rValue, title, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
                () => Transform.scale(
              scale: 1.3,
              child: Radio(
                  groupValue: controller.selectedProfile.value,
                  value: rValue,
                  activeColor: AppColors.primary,
                  onChanged: (value) => controller.changeProfile(value)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Image.asset(
              image,
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(
            width: AppSizes.mdSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.sm,
                ),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: 0.07,
                      color: AppColors.grey,
                    ),
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.sm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
