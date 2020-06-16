import 'package:library_utils/library_utils.dart';

class LanguageConfig {
  static const cacheKey = 'language-cache';
  static String languageCode;

  static Future<String> init() async {
    String cache = SpUtil.getString(cacheKey);
    if (cache != null && cache.isNotEmpty) {
      languageCode = cache;
      return cache;
    }
    return null;
  }

  static void save(String value) async {
    languageCode = value;
    SpUtil.putString(cacheKey, value);
  }
}
