import 'package:data/data.dart' as data;
import 'package:domain/domain.dart' as domain;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart' as presentation;

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$injectDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> injectDependencies() async {
  $injectDependencies(getIt);
  await data.injectDependencies(getIt);
  domain.injectDependencies(getIt);
  presentation.injectDependencies(getIt);
}
