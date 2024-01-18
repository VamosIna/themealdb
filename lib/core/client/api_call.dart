import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../failure/failure.dart';

/// Mapping api call into either success or failure.
/// Returns Either.
Future<Either<Failure, T>> apiCall<T>(Future<T> t) async {
  try {
    print(t.toString());
    final futureCall = await t;
    return Right(futureCall);
  } on DioException catch (e) {
    print(e.toString());
    return Left(GeneralFailure());
  } catch (e, stacktrace) {
    print(e.toString());
    return Left(GeneralFailure());
  }
}
