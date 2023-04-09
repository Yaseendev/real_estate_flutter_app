part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LangChange extends SettingsEvent {
  final String langCode;
  LangChange(this.langCode);

  @override
  List<Object> get props => [langCode];
}
