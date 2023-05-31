import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  Dialogs._internal();

  static Widget quizStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      // title: const Text("Hi.."),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi..",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "Please login before start the quiz",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onTap, child: const Text('Okay'))
      ],
    );
  }

  static Future<bool> quizEndDialog() async {
    return (await showDialog(
          context: Get.overlayContext!,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text(
                'Do you want to exit the quiz without completing it ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Get.back(result: true),
                child: Text(
                  'bang udah bang',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text('No',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
              ),
            ],
          ),
        )) ??
        false;
  }

  static Future startDialog({required VoidCallback onTap}) {
    return showDialog(
      context: Get.overlayContext!,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content:
            const Text('Do you want to exit the quiz without completing it ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text(
              'Wait',
            ),
          ),
          TextButton(onPressed: onTap, child: const Text("Let's go")),
        ],
      ),
    );
  }
}
