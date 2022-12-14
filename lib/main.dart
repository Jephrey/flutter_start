import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_start/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Turn off the # in the URLs on the web.
    usePathUrlStrategy();

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
  });
}
