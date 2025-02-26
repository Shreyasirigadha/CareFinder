import 'package:flutter/material.dart';
import 'package:senior/services/localization_service.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationService.of(context).translate('Language Support')),
      ),
      body: ListView(
        children: [
          _buildLanguageTile(context, 'English', 'en', 'US'),
          _buildLanguageTile(context, 'Spanish', 'es', 'ES'),
          _buildLanguageTile(context, 'Telugu', 'te', 'IN'),
          _buildLanguageTile(context, 'Hindi', 'hi', 'IN'),
          _buildLanguageTile(context, 'Tamil', 'ta', 'IN'),
          _buildLanguageTile(context, 'Kannada', 'kn', 'IN'),
        ],
      ),
    );
  }

  ListTile _buildLanguageTile(BuildContext context, String language, String languageCode, String countryCode) {
    return ListTile(
      title: Text(language),
      onTap: () => _changeLanguage(context, languageCode, countryCode),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode, String countryCode) {
    Locale locale = Locale(languageCode, countryCode);
    LocalizationService.of(context).changeLocale(locale);
    Navigator.pop(context);
  }
}
