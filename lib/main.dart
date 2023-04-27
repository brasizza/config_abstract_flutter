import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_abstract/app/modules/home/home_controller.dart';
import 'package:remote_config_abstract/app/modules/home/home_page.dart';
import 'package:remote_config_abstract/core/config/base_config.dart';
import 'package:remote_config_abstract/core/config_types.dart';
import 'package:remote_config_abstract/core/instance_maker.dart';
import 'package:remote_config_abstract/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final Env instance = await InstanceMaker.create(ConfigType.dotenv);
  GetIt.I.registerSingleton<Env>(instance);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(
      controller: HomeController(),
    ),
  ));
}
