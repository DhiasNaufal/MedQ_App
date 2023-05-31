import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/widgets/common/google_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: UIParameters.getHeight(context) * 0.05,
                    right: UIParameters.getWidth(context) * 0.1,
                    left: UIParameters.getWidth(context) * 0.1,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: customsvg(context),
                        borderRadius: BorderRadius.circular(10)),
                    child: Wrap(
                      children: [
                        SvgPicture.asset(
                          "assets/images/vr-man.svg",
                          height: UIParameters.getHeight(context) * 0.3,
                        ),
                      ],
                    ),
                  ),
                ),
                // SvgPicture.asset(
                //   "assets/images/Man-experiencing-VR-gamingplay-vr-game.svg",
                //   height: UIParameters.getHeight(context) * 0.5,
                //   //color: Theme.of(context).primaryColor,
                //   colorBlendMode: BlendMode.hue,
                //   //theme: Theme.of(context).,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Let's Get Started",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: UIParameters.getWidth(context) * 0.1,
                      left: UIParameters.getWidth(context) * 0.1,
                      bottom: UIParameters.getHeight(context) * 0.15),
                  child: GoogleSignInButton(
                    onTap: (() => controller.siginInWithGoogle()),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: 20,
                //       right: UIParameters.getWidth(context) * 0.1,
                //       left: UIParameters.getWidth(context) * 0.1,
                //       bottom: UIParameters.getHeight(context) * 0.15),
                //   child: Center(
                //     child: MainButton(
                //         child: Stack(
                //           children: [
                //             SvgPicture.asset(
                //               'assets/icons/google.svg',
                //             ),
                //             Center(
                //               child: Text(
                //                 'Sign in  with google',
                //                 style: TextStyle(
                //                     // color: Theme.of(context).primaryColor,
                //                     ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         color: Colors.white,
                //         onTap: (() => controller.siginInWithGoogle())),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIParameters.getWidth(context) * 0.1),
                  child: const Text(
                    "By continuing you agreeing to our privacy policy and to follow our rules, and you are over it",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // body: Container(
      //     constraints: const BoxConstraints(maxWidth: kTabletChangePoint),
      //     padding: const EdgeInsets.symmetric(horizontal: 30),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(gradient: mainGradient(context)),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       //crossAxisAlignment: CrossAxisAlignment.,
      //       children: [
      //         SizedBox(
      //           height: 90,
      //         ),
      //         SvgPicture.asset('assets/icons/bright.svg'),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
      //           child: Text(
      //             'Masuk dengan Google dan kalahkan lawan lawanmu!',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //                 color: kOnSurfaceTextColor,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 17),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      //           child: MainButton(
      //             onTap: () {
      //               controller.siginInWithGoogle();
      //             },
      //             color: Colors.white,
      //             child: Stack(
      //               children: [
      //                 Positioned(
      //                     top: 0,
      //                     bottom: 0,
      //                     left: 0,
      //                     child: SvgPicture.asset(
      //                       'assets/icons/google.svg',
      //                     )),
      //                 Center(
      //                   child: Text(
      //                     'Sign in  with google',
      //                     style: TextStyle(
      //                       color: Theme.of(context).primaryColor,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     )),
    );
  }
}
