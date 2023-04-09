import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/themes.dart';
import 'login_button.dart';
import 'social_login.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onSignUp;
  const LoginForm({
    super.key,
    required this.onSignUp,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool passwordVisible = true;

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
                hintText: getTranslated('password', context),
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
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                  style: TextButton.styleFrom(
                    alignment: AlignmentDirectional.topEnd,
                    padding: EdgeInsets.zero,
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(getTranslated('forgot_password', context))),
            ),
            const SizedBox(height: 20),
            AccountButton(
              label: getTranslated('login', context).toUpperCase(),
              onPress: () {},
            ),
            const SizedBox(height: 30),
            Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: '${getTranslated('accountless', context)} ',
                  children: [
                    TextSpan(
                      text: getTranslated('signup', context),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => widget.onSignUp(),
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
