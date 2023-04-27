import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:remote_config_abstract/core/config/base_config.dart';

class DotEnvConfig implements Env {
  @override
  Future<void> load() async {
    await dotenv.load();
  }

  @override
  operator [](String key) {
    return dotenv.maybeGet(key);
  }

  @override
  String toString() => 'DotEnvConfig';
}
