import 'package:get_storage/get_storage.dart';

class Preferences {
  static final _storage = GetStorage();


  static void saveTab(int index) {
    _storage.write('selectedTab', index);
  }

  static int getTab() {
    return _storage.read('selectedTab') ?? 0; // Default to dashboard tab
  }
}
