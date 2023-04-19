abstract class Env {
  Future<void> load();
  get<T>(String key);
}
