import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: r'$injectDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
void injectDependencies(GetIt instance) => $injectDependencies(instance);
