import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_abstract/app/modules/env/env_controller.dart';
import 'package:remote_config_abstract/app/modules/env/env_page.dart';
import 'package:remote_config_abstract/app/modules/home/home_controller.dart';
import 'package:remote_config_abstract/core/config/base_config.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CONFIGS'),
        ),
        body: EnvPage(
          controller: EnvController(config: GetIt.I.get<Env>()),
        ));
  }
}
