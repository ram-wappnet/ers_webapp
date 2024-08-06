import 'dart:developer';

import 'package:flutter/foundation.dart';

void printErsLog(String message, {String? name = "LOG"}) {
  if (kDebugMode) {
    log(' $message', name: name!);
  }
}
