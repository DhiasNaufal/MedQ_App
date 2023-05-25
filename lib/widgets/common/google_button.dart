import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColor),
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                //color: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/google.svg',
                ),
              ), // <-- Use 'Image.asset(...)' here
              SizedBox(width: 12),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: customsvg(context)),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
