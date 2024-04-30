import 'package:fpdart/fpdart.dart';
import 'package:spriver_flutter/core/error/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
