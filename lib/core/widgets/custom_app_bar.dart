import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.onTapLeading,
    required this.onTapAccount,
  });

  final VoidCallback onTapLeading, onTapAccount;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colFFFFFF,
      leading: IconButton(
        onPressed: onTapLeading,
        icon: Icon(Icons.menu, size: 32.sp),
      ),
      actions: [
        InkWell(
          onTap: onTapAccount,
          child: ImageIcon(
            const AssetImage(AppImages.accountlogo),
            size: 45.h,
          ).withPadding(padding: EdgeInsets.only(right: 15.w)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
