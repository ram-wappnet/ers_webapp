import 'package:get_it/get_it.dart';

import 'utils/helper/validation/validation.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;
Future<void> dependencyInjectorInit() async {
  getIt.registerLazySingleton<FormValidations>(() =>
      FormValidations()); // Registering AuthHttpApiRepository as a lazy singleton for AuthApiRepository
}
/// Add syntax sugar for quickly accessing the singleton services  in the app
FormValidations get formValidation => GetIt.I.get<FormValidations>();
