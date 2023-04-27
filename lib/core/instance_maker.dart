import 'package:remote_config_abstract/core/config/base_config.dart';
import 'package:remote_config_abstract/core/config/env/env_config.dart';
import 'package:remote_config_abstract/core/config/remote/remote_config.dart';
import 'package:remote_config_abstract/core/config_types.dart';

class InstanceMaker {
  static Future<Env> create(ConfigType type) async {
    late final Env config;
    switch (type) {
      case ConfigType.dotenv:
        config = DotEnvConfig();
        await config.load();
        return config;
      case ConfigType.remoteConfig:
        return RemoteConfig()..load();
      default:
        throw UnimplementedError();
    }
  }
}
