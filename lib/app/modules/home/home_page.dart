import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remote_config_abstract/app/modules/env/env_controller.dart';
import 'package:remote_config_abstract/app/modules/env/env_page.dart';
import 'package:remote_config_abstract/app/modules/home/home_controller.dart';
import 'package:remote_config_abstract/app/modules/remote_config/remote_controller.dart';
import 'package:remote_config_abstract/app/modules/remote_config/remote_page.dart';

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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: const Text('Config Remote')),
                ElevatedButton(
                    onPressed: () {
                      pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: const Text('Config ENV ')),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  RemotePage(
                    controller: RemoteController(config: GetIt.I.get(instanceName: 'Remote')),
                  ),
                  EnvPage(
                    controller: EnvController(config: GetIt.I.get(instanceName: 'Env')),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
