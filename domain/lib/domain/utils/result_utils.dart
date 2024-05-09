import 'package:async/async.dart';

extension GenericObjectExt<T> on T {
  ValueResult<T> toSuccessfulResult() {
    return ValueResult(this);
  }
}

extension ResultFutureExt<T> on Future<T> {
  Future<Result<T>> mapToResult() {
    return then(
      (value) => value.toSuccessfulResult(),
      onError: (error) => ErrorResult(error),
    );
  }
}

extension ResultExt<T> on Result<T> {
  Result<R> map<R>(R Function(T) mapper) {
    if (isValue) {
      return ValueResult(mapper(asValue!.value));
    } else {
      return ErrorResult(asError!.error);
    }
  }
}

extension FutureResultExt<T> on Future<Result<T>> {
  Future<Result<R>> map<R>(R Function(T) mapper) async {
    return (await this).map(mapper);
  }

  Future<Result<R>> flatMapFuture<R>(
    Future<Result<R>> Function(T) mapper,
  ) async {
    final result = await this;
    return result.isValue
        ? mapper(result.asValue!.value)
        : Future.value(Result<R>.error(result.asError!.error));
  }
}
