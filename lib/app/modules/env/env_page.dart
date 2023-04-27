import 'package:flutter/material.dart';
import 'package:remote_config_abstract/app/modules/env/env_controller.dart';

class EnvPage extends StatelessWidget {
  final EnvController controller;

  const EnvPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "UTILIZANDO ENV CONFIG",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('My Url:  ${controller.config['base_url']}'),
              Text('Can show:  ${controller.config['can_show']}'),
              Text('Parameters:  ${controller.config['parameters']}'),
              Text('Max per page:  ${controller.config['max_per_page']}'),
            ],
          ),
        ),
      ],
    );
  }
}
