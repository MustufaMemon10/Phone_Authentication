import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_assignment/core/utils/sizes.dart';
class SAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SAppbar(
      {super.key,
      this.leadingIcon,  this.showLeadingIcon = false,});

  final IconData? leadingIcon;
  final bool showLeadingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultPadding,
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showLeadingIcon ?IconButton(
                onPressed: () => Get.back(),
                icon:  Icon(leadingIcon),color:Colors.black,iconSize: 24,): null,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
