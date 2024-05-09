import 'package:hive/hive.dart';

abstract class HiveDataSource<T> {
  const HiveDataSource(this.boxName);

  final String boxName;

  Box<T> get box => Hive.box<T>(boxName);

  Iterable<T> getValues() {
    return box.values.whereType<T>();
  }

  Stream<List<T>> getValuesStream() {
    return box.watch().map((_) => getValues().toList());
  }

  Future<void> init() async {
    await Hive.openBox<T>(boxName);
  }
}
