import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static const String projectUrl = "https://vauztiycqbhmbitpstiq.supabase.co";
  static const String publishableKey =
      "sb_publishable_OoBJLCNXCFflNCOUUHr3og__FaTZe0i";

  static Future<void> init() async {
    try {
      await Supabase.initialize(
        url: projectUrl,
        publishableKey: publishableKey,
      );
    } catch (error, stack) {
      // Supabase creates its singleton before async auth initialization finishes.
      // Reset a partial initialization so the failed step can safely retry.
      try {
        await Supabase.instance.dispose();
      } catch (_) {
        // There may be no initialized singleton to dispose yet.
      }
      Error.throwWithStackTrace(error, stack);
    }
  }
}
