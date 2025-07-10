import 'package:flutter/material.dart';

import '../../route/custom_router/custom_route.dart';
import '../../utils/constants/color_const.dart';
import '../../utils/constants/hex_color.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.backgroundColor = Colors.white,
    this.actions,
    this.leading,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: CustomTextEnum(
        title,
        color: HexColor.fromHex(ColorConst.primaryDark),
      ).textMediumMD(),
      leading: leading ??
          CustomIconButton(
            icon: Icon(Icons.arrow_back,
                color: HexColor.fromHex(ColorConst.primaryDark)),
            onPressed: () {
              CustomRoute().back();
            },
          ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
