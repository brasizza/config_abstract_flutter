import 'package:flutter/material.dart';
import 'package:remote_config_abstract/app/modules/remote_config/remote_controller.dart';

class RemotePage extends StatelessWidget {
  final RemoteController controller;

  const RemotePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "UTILIZANDO REMOTE CONFIG",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('My Url:  ${controller.config.get<String>('base_url')}'),
              Text('Can show:  ${controller.config.get<bool>('can_show')}'),
              Text('Parameters:  ${controller.config.get<Map>('parameters')}'),
              Text('Max per page:  ${controller.config.get<int>('max_per_page')}'),
            ],
          ),
        ),
      ],
    );
  }
}
