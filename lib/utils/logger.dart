import 'dart:developer';

/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

class Logger {
  static void write(String text, {bool isError = false}) {
    Future<void>.microtask(() => log('** $text. isError: [$isError] **'));
  }
}
