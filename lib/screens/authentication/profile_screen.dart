import 'package:cdss_quiz/widgets/profile/recent_quiz_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/configs.dart';
import '../../controllers/controllers.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = Get.find<AuthController>();
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(
            //backColor: Colors.white,
            ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            )),
            Positioned.fill(
                child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: UIParameters.screenPadding.copyWith(top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              foregroundImage:
                                  NetworkImage(_auth.getUser()!.photoURL!),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              _auth.getUser()!.displayName ?? '',
                              style: kHeaderTS.copyWith(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'My recent tests ',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ContentArea(
                        addPadding: false,
                        color: customContentHomeColor(context),
                        child: ListView.separated(
                          padding: UIParameters.screenPadding,
                          itemCount: controller.allRecentTest.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return RecentQuizCard(
                                recentTest: controller.allRecentTest[index]);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
