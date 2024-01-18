
import '../di/di_core.dart';

class Config {
  /// Initialize Config.
  static Future<void> init() async {
    await configureCoreDependencies();
  }
}
