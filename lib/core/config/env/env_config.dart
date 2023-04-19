import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:remote_config_abstract/core/config/base_config.dart';

class EnvConfig implements Env {
  @override
  Future<void> load() async {
    await dotenv.load();
  }

  @override
  get<T>(String key) {
    switch (T) {
      case String:
        return dotenv.maybeGet(key) as String;
      case int:
        return int.tryParse(dotenv.maybeGet(key) ?? '0');
      case bool:
        return dotenv.maybeGet(key) == 'false' ? false : true;
      case double:
        return double.tryParse(dotenv.maybeGet(key) ?? '0.00');
      case Map:
      case List:
        return json.decode(dotenv.maybeGet(key) ?? "[]");
      default:
        return dotenv.maybeGet(key);
    }
  }
}
