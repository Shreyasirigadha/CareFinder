import 'package:flutter/material.dart';
import 'package:senior/services/localization_service.dart';

class LocalizationDelegate extends LocalizationsDelegate<LocalizationService> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService localizationService = LocalizationService();
    localizationService.changeLocale(locale);
    return localizationService;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationService> old) => false;
}
