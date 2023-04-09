import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/settings_repo.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsInitial(
            appLang: Locale(
                locator.get<SharedPreferences>().getString('lang') ??
                    Platform.localeName.split('_')[0]))) {
    final SettingsRepository settingsRepository = SettingsRepository();

    on<LangChange>((event, emit) {
      settingsRepository.changeLang(event.langCode);
      emit(SettingsChanged(appLang: Locale(event.langCode)));
    });
  }
}
