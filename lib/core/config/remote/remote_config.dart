import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:remote_config_abstract/core/config/base_config.dart';

class RemoteConfig implements Env {
  late final FirebaseRemoteConfig remoteConfig;
  @override
  Future<void> load() async {
    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 5),
      minimumFetchInterval: Duration.zero,
    ));
    await remoteConfig.fetchAndActivate();
  }

  @override
  get<T>(String key) {
    switch (T) {
      case String:
        return remoteConfig.getString(key);
      case int:
        return remoteConfig.getInt(key);
      case bool:
        return remoteConfig.getBool(key);
      case double:
        return remoteConfig.getDouble(key);

      case Map:
      case List:
        return json.decode(remoteConfig.getString(key));

      default:
        return remoteConfig.getString(key);
    }
  }
}
