import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.showActionIcon = false,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap,
    this.backColor,
  }) : super(key: key);
  final Color? backColor;
  final String title;
  final Widget? titleWidget;
  final bool showActionIcon;
  final Widget? leading;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kMobileScreenPadding,
              vertical: kMobileScreenPadding / 1.2),
          child: Stack(
            children: [
              Positioned.fill(
                child: titleWidget == null
                    ? Center(child: Text(title, style: kAppBarTS))
                    : Center(child: titleWidget!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading ??
                      Transform.translate(
                          offset: const Offset(-14, 0),
                          child: BackButton(
                            color: backColor,
                          )), // transform to allign icons with body content
                  if (showActionIcon)
                    Transform.translate(
                      offset: const Offset(10,
                          0), // transform to allign icons with body content =>  - CircularButton.padding
                      child: CircularButton(
                        onTap: onMenuActionTap ??
                            () {
                              Get.toNamed(QuizOverviewScreen.routeName);
                            },
                        material: MaterialType.transparency,
                        child: Icon(
                          AppIcons.menu,
                          color: backColor,
                        ),
                      ),
                    )
                ],
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
