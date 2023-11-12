// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:flutter_native_splash/flutter_native_splash_web.dart';
import 'package:location_web/location_web.dart';
import 'package:mapbox_gl_web/mapbox_gl_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FlutterNativeSplashWeb.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  MapboxMapPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
