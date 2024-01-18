import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_core.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initCoreGetIt',
)
Future<void> configureCoreDependencies({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    getIt.$initCoreGetIt(
        environment: environment, environmentFilter: environmentFilter);
