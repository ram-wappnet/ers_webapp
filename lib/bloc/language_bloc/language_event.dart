part of 'language_bloc.dart';

// Language Event
abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageChanged extends LanguageEvent {
  final Locale locale;
  const LanguageChanged({required this.locale});
  @override
  List<Object> get props => [locale];
}
