import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_browser/features/settings_lang_switch/repositories/language_repository.dart';

final languageRepositoryProvider = Provider<LanguageRepository>((ref) {
  return LanguageRepository();
});
