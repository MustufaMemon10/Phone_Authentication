import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_auth_assignment/core/utils/colors.dart';
import 'package:phone_auth_assignment/core/utils/images.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';
import 'package:phone_auth_assignment/core/widgets/appbar.dart';
import 'package:phone_auth_assignment/screens/phone_number_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SAppbar(),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.defaultPadding,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.emptyImage,
                      height: 60,
                    ),
                    const SizedBox(
                      height: AppSizes.maxSize,
                    ),
                    const Text(
                      'Please select your Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    const Text(
                      'You can change the language ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey),
                    ),
                    const Text(
                      'at any time.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey),
                    ),
                    const SizedBox(
                      height: AppSizes.lg,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: AppSizes.maxSize),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: AppSizes.xs
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedLanguage,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          DropdownButton<String>(
                            dropdownColor: AppColors.grey,
                            underline: const SizedBox(),
                            value: _selectedLanguage,
                            elevation: 0,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLanguage = newValue!;
                              });
                            },
                            items: <String>['English', 'Hindi']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: const SizedBox(),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.lg,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.maxSize),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: ()=> Get.to(()=> const PhoneScreen(),transition: Transition.rightToLeft), child:  Text(
                          'NEXT',style:  GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white,
                        )),
                    ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Image.asset(AppImage.bg2,fit: BoxFit.cover,),
                    Positioned(
                      child:
                      Image.asset(AppImage.bg1,fit: BoxFit.cover),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
