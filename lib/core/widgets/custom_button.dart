
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/phone_controller.dart';
import '../utils/sizes.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
     required this.title, required this.onTap,
  });

  final controller = Get.put(PhoneController());
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.btnPadding),
          ),
          onPressed: onTap,
          child:  Text(
              title,style: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white,
          )
          ),
        ));
  }
}
