import 'package:dartz/dartz.dart';
import 'package:fit_up/core/services/errors/failure.dart';
import 'package:fit_up/core/services/errors/supabase_error_mapper.dart';
import 'package:flutter/foundation.dart';

/// Runs a repository operation and returns its success or failure.
///
/// Include model conversion in [request] so parsing errors are handled too.
/// The callback controls the returned data; no response envelope is assumed.
Future<Either<Failure, T>> requestHandler<T>(
  Future<T> Function() request,
) async {
  try {
    final data = await request();
    return Right<Failure, T>(data);
  } catch (error, stackTrace) {
    if (kDebugMode) {
      // Preserve the call site without logging backend payloads or credentials.
      debugPrintStack(
        label: 'Request failed (${error.runtimeType}).',
        stackTrace: stackTrace,
      );
    }

    return Left<Failure, T>(SupabaseErrorMapper.map(error));
  }
}
