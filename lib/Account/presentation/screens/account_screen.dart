import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/Settings/presentation/screens/settings_screen.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/themes.dart';

import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 25,
            left: 8,
            right: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
Images.kDefaultProfile,
                  width: 90.sp,
                  height: 90.sp,
                ),
              ),
              SizedBox(height: 10),
              TextButton.icon(
                icon: const Icon(Icons.login),
                label: Text(
                  getTranslated('login', context),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),
              SizedBox(height: 20),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: ListTile.divideTiles(context: context, tiles: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.settings_rounded,
                          color: Colors.white,
                        ),
                        backgroundColor: AppColors.PRIMARY_COLOR,
                      ),
                      title: Text(getTranslated('settings', context)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SettingsScreen())),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.privacy_tip_rounded,
                          color: Colors.white,
                        ),
                        backgroundColor: AppColors.PRIMARY_COLOR,
                      ),
                      title: Text(getTranslated('privacy_policy', context)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ]).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
