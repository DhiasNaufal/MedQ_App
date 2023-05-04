import 'package:cdss_quiz/configs/configs.dart';
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
      body: Container(
          constraints: const BoxConstraints(maxWidth: kTabletChangePoint),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.,
            children: [
              SizedBox(
                height: 90,
              ),
              SvgPicture.asset('assets/icons/bright.svg'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                child: Text(
                  'Masuk dengan Google dan kalahkan lawan lawanmu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kOnSurfaceTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                child: MainButton(
                  onTap: () {
                    controller.siginInWithGoogle();
                  },
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          child: SvgPicture.asset(
                            'assets/icons/google.svg',
                          )),
                      Center(
                        child: Text(
                          'Sign in  with google',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
