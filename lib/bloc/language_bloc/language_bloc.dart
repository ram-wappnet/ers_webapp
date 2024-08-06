import 'dart:async';
import 'package:get_storage/get_storage.dart';

import '../../export.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageInitial()) {
    on<LanguageChanged>(_setLocale);
  }

  Future<void> _setLocale(
      LanguageChanged event, Emitter<LanguageState> emit) async {
    GetStorage().write("currentLocal", event.locale.languageCode);
    printErsLog(event.locale.languageCode);
    printErsLog("READ ${GetStorage().read("currentLocal")}");
    //call api to change language
    emit(const LanguageInitial());
  }
}
