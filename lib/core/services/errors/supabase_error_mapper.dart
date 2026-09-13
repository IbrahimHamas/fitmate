import 'dart:async';

import 'package:fit_up/core/services/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class SupabaseErrorMapper {
  static const Map<String, String> _authMessages = {
    'invalid_credentials': 'The sign-in details are incorrect.',
    'email_not_confirmed': 'Please confirm your email before signing in.',
    'phone_not_confirmed': 'Please confirm your phone number before signing in.',
    'email_exists': 'An account with this email already exists.',
    'user_already_exists': 'An account with these details already exists.',
    'weak_password': 'Please choose a stronger password.',
    'same_password': 'Please choose a password different from your current one.',
    'otp_expired': 'The verification link or code has expired. Request a new one.',
    'session_not_found': 'Please sign in again to continue.',
    'session_expired': 'Your session has expired. Please sign in again.',
    'refresh_token_not_found': 'Please sign in again to continue.',
    'refresh_token_already_used': 'Please sign in again to continue.',
    'over_request_rate_limit': 'Too many attempts. Please try again later.',
    'over_email_send_rate_limit':
        'Too many emails requested. Please try again later.',
    'over_sms_send_rate_limit':
        'Too many verification messages requested. Please try again later.',
    'request_timeout': 'The request timed out. Please try again.',
  };

  static const Map<String, String> _databaseMessages = {
    '23505': 'This record already exists.',
    '23503': 'This action could not be completed because of related records.',
    '23502': 'Some required information is missing.',
    '23514': 'Some provided information is invalid.',
    '22P02': 'Some provided information has an invalid format.',
    '42501': 'You do not have permission to perform this action.',
    'PGRST301': 'Please sign in again to continue.',
    // A single-row query can fail because it returned zero OR multiple rows.
    'PGRST116': 'The requested data could not be retrieved as expected.',
  };

  static Failure map(Object error) {
    if (error is TimeoutException) {
      return const Failure(
        message: 'The request timed out. Please try again.',
        code: 'timeout',
      );
    }

    if (error is AuthException) {
      final statusCode = int.tryParse(error.statusCode ?? '');
      final message = error is AuthRetryableFetchException
          ? 'Unable to reach the service. Please try again.'
          : _authMessages[error.code] ??
                _httpMessage(
                  statusCode,
                  fallback: 'Unable to complete authentication. Please try again.',
                );

      return Failure(
        message: message,
        code: error.code ?? 'auth_error',
        statusCode: statusCode,
      );
    }

    if (error is PostgrestException) {
      return Failure(
        message:
            _databaseMessages[error.code] ??
            'Unable to load or save data. Please try again.',
        // Postgres codes describe database errors, not HTTP status codes.
        code: error.code ?? 'database_error',
      );
    }

    if (error is StorageException) {
      final statusCode = int.tryParse(error.statusCode ?? '');
      return Failure(
        message: _httpMessage(
          statusCode,
          fallback: 'Unable to complete the file operation. Please try again.',
        ),
        code: 'storage_error',
        statusCode: statusCode,
      );
    }

    if (error is FunctionException) {
      return Failure(
        message: _httpMessage(
          error.status,
          fallback: 'Unable to complete the operation. Please try again.',
        ),
        code: 'function_error',
        statusCode: error.status > 0 ? error.status : null,
      );
    }

    if (error is FormatException || error is TypeError) {
      return const Failure(
        message: 'The returned data could not be processed. Please try again.',
        code: 'invalid_response',
      );
    }

    return const Failure(
      message: 'An unexpected error occurred. Please try again.',
      code: 'unexpected_error',
    );
  }

  static String _httpMessage(int? statusCode, {required String fallback}) {
    switch (statusCode) {
      case 401:
        return 'Please sign in again to continue.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'The requested item could not be found.';
      case 409:
        return 'This action conflicts with existing data.';
      case 413:
        return 'The submitted data is too large.';
      case 429:
        return 'Too many requests. Please try again later.';
      default:
        if (statusCode != null && statusCode >= 500 && statusCode < 600) {
          return 'The service is temporarily unavailable. Please try again later.';
        }
        return fallback;
    }
  }
}
