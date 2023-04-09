import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/themes.dart';
import 'login_button.dart';
import 'social_login.dart';

class SignupForm extends StatefulWidget {
  final VoidCallback onLogin;
  const SignupForm({
    super.key,
    required this.onLogin,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confPassword = '';
  bool passwordVisible = true;
  String phoneNum = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getTranslated('name', context),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: getTranslated('full_name', context),
                prefixIcon: const Icon(Icons.badge_outlined),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                return !GetUtils.isEmail(value ?? '')
                    ? getTranslated('field_required', context)
                    : null;
              },
              maxLines: 1,
              keyboardType: TextInputType.name,
              onChanged: (value) => name = value,
            ),
            const SizedBox(height: 15),
            Text(
              getTranslated('email', context),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'email@example.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              textInputAction: TextInputAction.next,
              //initialValue: startPrice != null ? '$startPrice': null,
              validator: (value) {
                return !GetUtils.isEmail(value ?? '')
                    ? getTranslated('enter_valid_email', context)
                    : null;
              },
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 15),
            Text(
              getTranslated('phone_number', context),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                prefixIcon: const Icon(Icons.phone),
                prefix: Localizations.localeOf(context).languageCode == 'en'
                    ? const Text(
                        '+20-',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
                suffix: Localizations.localeOf(context).languageCode == 'en'
                    ? null
                    : const Text(
                        '+20',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                      ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       '+20',
                //       textAlign: TextAlign.center,
                //       style:
                //           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                //     ),
                //   ],
                // ),
              ),
              maxLines: 1,
              maxLength: 11,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.next,
              onChanged: (value) => phoneNum = value,
              validator: (value) {
                return value!.trim().isNotEmpty
                    ? int.tryParse(value.trim()) == null
                        ? getTranslated('phone_invalid', context)
                        : null
                    : getTranslated('field_required', context);
              },
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            Text(
              getTranslated('password', context),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                prefixIcon: const Icon(Icons.password),
                suffixIcon: passwordVisible
                    ? IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () => setState(() {
                          passwordVisible = false;
                        }),
                      )
                    : IconButton(
                        onPressed: () => setState(() {
                          passwordVisible = true;
                        }),
                        icon: const Icon(Icons.visibility_off),
                      ),
              ),
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) => password = value,
              obscureText: passwordVisible,
              validator: (value) {
                return value!.trim().isNotEmpty
                    ? value.trim().length >= 8
                        ? null
                        : getTranslated('password_invalid', context)
                    : getTranslated('field_required', context);
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 15),
            Text(
              getTranslated('conf_password', context),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                prefixIcon: const Icon(Icons.password),
                suffixIcon: passwordVisible
                    ? IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () => setState(() {
                          passwordVisible = false;
                        }),
                      )
                    : IconButton(
                        onPressed: () => setState(() {
                          passwordVisible = true;
                        }),
                        icon: const Icon(Icons.visibility_off),
                      ),
              ),
              maxLines: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) => confPassword = value,
              obscureText: passwordVisible,
              validator: (value) {
                return value!.trim().isNotEmpty
                    ? value.trim().length >= 8
                        ? null
                        : getTranslated('password_unmatched', context)
                    : getTranslated('field_required', context);
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 25),
            AccountButton(
              label: getTranslated('signup', context).toUpperCase(),
              onPress: () {},
            ),
            const SizedBox(height: 15),
            Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: '${getTranslated('have_account', context)} ',
                  children: [
                    TextSpan(
                      text: getTranslated('signin', context),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => widget.onLogin(),
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            SocialLogin(),
          ],
        ),
      ),
    );
  }
}
