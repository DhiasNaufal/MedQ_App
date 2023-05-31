import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:cdss_quiz/controllers/common/drawer_controller.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView<MyDrawerController> {
  const CustomDrawer({super.key});
  static const String routeName = '/drawer';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      padding: UIParameters.screenPadding,
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: kOnSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: kOnSurfaceTextColor,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                )),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => controller.user.value == null
                      ? TextButton.icon(
                          icon: const Icon(Icons.login_rounded),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              elevation: 0,
                              backgroundColor: Colors.white.withOpacity(0.5)),
                          onPressed: () {
                            controller.signIn();
                          },
                          label: const Text("Sign in"))
                      : Stack(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: UIParameters.getHeight(context) * 0.055),
                            child: Container(
                              height: UIParameters.getHeight(context) * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //Get.toNamed(ProfileScreen.routeName);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 10),
                              child: Center(
                                child: CircleAvatar(
                                  foregroundImage:
                                      controller.user.value!.photoURL == null
                                          ? null
                                          : NetworkImage(
                                              controller.user.value!.photoURL!),
                                  backgroundColor: Colors.white,
                                  radius:
                                      UIParameters.getHeight(context) * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ])),
                  const Spacer(flex: 1),
                  _DrawerButton(
                      onPressed: () {}, //controller.github(),
                      icon: AppIcons.github,
                      label: 'GitHub'),
                  _DrawerButton(
                    icon: Icons.code,
                    label: 'Source Code',
                    onPressed: () {}, //controller.downloadSourceCode(),
                  ),
                  _DrawerButton(
                      icon: AppIcons.contact,
                      label: 'Another project',
                      onPressed: () {}),
                  const Spacer(flex: 4),
                  _DrawerButton(
                    icon: AppIcons.logout,
                    label: 'Sign out',
                    onPressed: () {
                      controller.signOut();
                    },
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Align(alignment: Alignment.centerLeft, child: Text(label)));
  }
}
