import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Text(
              ' ${getTranslated('continue_with', context)} ',
              style: TextStyle(color: Colors.grey[700]),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook_rounded),
                label: Text(getTranslated('facebook', context)),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF4267B2)),
                  shape:
                      MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                          vertical: 12, horizontal: 35)),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.google),
                label: Text(getTranslated('google', context)),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFFE6242E)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                          vertical: 12, horizontal: 35)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}