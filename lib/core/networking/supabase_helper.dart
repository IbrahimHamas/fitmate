import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static const String projectUrl = "https://vauztiycqbhmbitpstiq.supabase.co";
  static const String publishableKey =
      "sb_publishable_OoBJLCNXCFflNCOUUHr3og__FaTZe0i";

  static Future<void> init() async {
    await Supabase.initialize(url: projectUrl, publishableKey: publishableKey);
  }
}
