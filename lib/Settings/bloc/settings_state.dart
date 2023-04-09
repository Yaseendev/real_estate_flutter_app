part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final Locale appLang;
  const SettingsState({required this.appLang});

  @override
  List<Object> get props => [appLang];
}

class SettingsInitial extends SettingsState {
  
  SettingsInitial({required super.appLang});

  @override
  List<Object> get props => [super.appLang];
}

class SettingsChanged extends SettingsState {
  
  SettingsChanged({required super.appLang});

  @override
  List<Object> get props => [super.appLang];
}
