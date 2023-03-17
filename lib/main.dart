import 'dart:io';

import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';
import 'init/theme/app_theme_light.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  late Directory dBDirectory;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    Hive.init(null);
  } else {
    dBDirectory = await getApplicationDocumentsDirectory();
    Hive.init(dBDirectory.path);
  }

  Hive.registerAdapter(DictionaryModelAdapter());
  await Hive.openBox("SavedBox");

  initalizaiton;
  runApp(MyApp());
}

Future initalizaiton(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final appTheme = AppThemeLight.theme;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
