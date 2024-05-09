import 'dart:async';

import 'package:async/async.dart';

abstract interface class UseCase<InputT, OutputT> {
  FutureOr<Result<OutputT>> execute(InputT input);
}
