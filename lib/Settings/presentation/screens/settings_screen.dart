import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/Settings/bloc/settings_bloc.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(getTranslated('settings', context)),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              ListTile(
                leading:const Icon(Icons.language),
                title: Text(getTranslated('language', context)),
                trailing: DropdownButton(
                    value: Localizations.localeOf(context).languageCode,
                    underline: Container(),
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.arrow_drop_down_rounded),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text('العربية'),
                        value: 'ar',
                      ),
                      DropdownMenuItem(
                        child: Text('English'),
                        value: 'en',
                      ),
                    ],
                    onChanged: (String? newLang) {
                      context
                          .read<SettingsBloc>()
                          .add(LangChange(newLang ?? 'en'));
                    }),
              ),
            ],
          ),
        );
  }
}
