import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../data_sources/data_sources.dart';
import '../models/models.dart';
import 'di.config.dart';

part 'data_sources_module.dart';
part 'hive_di.dart';

@InjectableInit(
  initializerName: r'$injectDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> injectDependencies(GetIt instance) async {
  await _injectHive();
  await $injectDependencies(instance);
}
