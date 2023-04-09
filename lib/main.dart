import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Primary/presentation/screens/primary_screen.dart';
import 'Settings/bloc/settings_bloc.dart';
import 'Shared/Localization/app_localization.dart';
import 'Splash/blocs/bloc/initroute_bloc.dart';
import 'Utils/locator.dart';
import 'Utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await locatorsSetup();
  runApp(const MyApp());

  // DateTime date1 = DateTime.parse('2022-11-13T13:43:24.000000Z');
  // DateTime date2 = DateTime.parse('2022-11-13T13:43:22.000000Z');
  // print(DateFormat.yMMMMEEEEd().format(date1));
  // print(DateFormat.yMMMMEEEEd().format(date2));
  // print(date2.difference(date1).inSeconds);
  // RelativeDateTime _relativeDateTime =
  //     RelativeDateTime(dateTime: date1, other: date2);
  // print(
  //     '${_relativeDateTime.timeDifference.value.abs()} ${_relativeDateTime.timeDifference.unit.name.replaceRange(0, 1, _relativeDateTime.timeDifference.unit.name[0].toUpperCase())}s');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<SettingsBloc>(
                create: (context) => SettingsBloc(),
              ),
              BlocProvider<InitrouteBloc>(
                create: (context) => InitrouteBloc()..add(UserCheckEvent()),
              ),
            ],
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, settings) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Real Estate App',
                  theme: ThemeData(
                    primarySwatch: AppColors.PRIMARY_SWATCH,
                    //primaryColor: AppColors.PRIMARY_COLOR,
                    textTheme: Typography.englishLike2018
                        .apply(bodyColor: Colors.black, fontSizeFactor: 1.sp),
                    // colorScheme: Theme.of(context).colorScheme.copyWith(
                    //       secondary: AppColors.SECONDARY_COLOR,
                    //     ),
                  ),
                  supportedLocales: [
                    const Locale('en'),
                    const Locale('ar'),
                  ],
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  locale: settings.appLang,
                  home: //ShareLocationScreen(),
                      const PrimaryScreen(), //InitialMapScreen(), //PrimaryScreen(),
                );
              },
            ),
          );
        });
  }
}
