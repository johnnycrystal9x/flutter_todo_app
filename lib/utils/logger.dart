/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'dart:developer';

class Logger {
  static void write(String text, {bool isError = false}) {
    Future<void>.microtask(() => log('** $text. isError: [$isError] **'));
  }
}
