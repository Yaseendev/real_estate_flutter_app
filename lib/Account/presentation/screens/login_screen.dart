import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/themes.dart';
import '../widgets/login_form.dart';
import '../widgets/signup_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PageController pageController = PageController(initialPage: 0);
  late final List<Widget> accountForms;
  int _currentIndex = 0;

  @override
  void initState() {
    accountForms = [
      LoginForm(
        onSignUp: () {
          goToPage(1);
        },
      ),
      SignupForm(
        onLogin: () => goToPage(0),
      ),
    ];
    super.initState();
  }

  Future<void> goToPage(int page) async {
    setState(() {
      _currentIndex = page;
    });
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        color: AppColors.PRIMARY_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _currentIndex == 0
                        ? getTranslated('login', context)
                        : getTranslated('signup', context),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _currentIndex == 0
                        ? getTranslated('welcome', context)
                        : getTranslated('create_account', context),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(35),
                  ),
                  color: Colors.white,
                ),
                child: PageView(
                  children: accountForms,
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
