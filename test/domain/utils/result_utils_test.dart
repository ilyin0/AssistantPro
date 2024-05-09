import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Future to Result', () {
    test('Value Future to Result', () async {
      final future = Future.value('test');
      final result = await future.mapToResult();
      expect(result.isValue, true);
    });

    test('Error Future to Result', () async {
      final future = Future.error('error');
      final result = await future.mapToResult();
      expect(result.isError, true);
    });
  });
}
