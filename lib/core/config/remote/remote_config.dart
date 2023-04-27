// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  operator [](String key) {
    return remoteConfig.getString(key);
  }

  @override
  String toString() => 'RemoteConfig';
}
