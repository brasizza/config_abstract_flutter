import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_abstract/app/modules/home/home_controller.dart';
import 'package:remote_config_abstract/app/modules/home/home_page.dart';
import 'package:remote_config_abstract/core/config/base_config.dart';
import 'package:remote_config_abstract/core/config/env/env_config.dart';
import 'package:remote_config_abstract/core/config/remote/remote_config.dart';
import 'package:remote_config_abstract/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  GetIt.I.registerSingleton<Env>(RemoteConfig()..load(), instanceName: 'Remote');
  GetIt.I.registerSingleton<Env>(EnvConfig()..load(), instanceName: 'Env');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(
      controller: HomeController(),
    ),
  ));
}
