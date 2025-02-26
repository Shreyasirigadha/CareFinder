import 'package:flutter/material.dart';

class LocalizationService {
  final Locale defaultLocale = Locale('en', 'US');
  late Locale _locale;
  late Map<String, Map<String, String>> _localizedValues;

  LocalizationService() {
    _locale = defaultLocale;
    _localizedValues = {
      'en': {
        'appTitle': 'CareFinder',
        'welcomeMessage': 'Welcome to CareFinder!',
        'emergencyContacts': 'Emergency Contacts',
        'profile': 'Profile',
        'prescriptions': 'Prescriptions',
        'settings': 'Settings',
        // English translations
      },
      'es': {
        'appTitle': 'CareFinder',
        'welcomeMessage': '¡Bienvenido a CareFinder!',
        'emergencyContacts': 'Contactos de emergencia',
        'profile': 'Perfil',
        'prescriptions': 'Recetas médicas',
        'settings': 'Configuración',
        // Spanish translations
      },
      'fr': {
        'appTitle': 'CareFinder',
        'welcomeMessage': 'Bienvenue sur CareFinder!',
        'emergencyContacts': 'Contacts d\'urgence',
        'profile': 'Profil',
        'prescriptions': 'Ordonnances',
        'settings': 'Paramètres',
        // French translations
      },
      'te': {
        'appTitle': 'CareFinder',
        'welcomeMessage': 'CareFinder లో స్వాగతం!',
        'emergencyContacts': 'అత్యవసర సంప్రదించండి',
        'profile': 'ప్రొఫైల్',
        'prescriptions': 'రసీలు',
        'settings': 'సెట్టింగులు',
        // Telugu translations
      },
      'hi': {
        'appTitle': 'CareFinder',
        'welcomeMessage': 'CareFinder में आपका स्वागत है!',
        'emergencyContacts': 'आपातकालीन संपर्क',
        'profile': 'प्रोफ़ाइल',
        'prescriptions': 'निर्धारण',
        'settings': 'सेटिंग्स',
        // Hindi translations
      },
      'ta': {
        'appTitle': 'CareFinder',
        'welcomeMessage': 'கேர் பைண்டரில் வரவேற்கின்றேன்!',
        'emergencyContacts': 'அவசர தொடர்புகள்',
        'profile': 'சுயவிவரம்',
        'prescriptions': 'சூதாட்சிகள்',
        'settings': 'அமைப்புகள்',
        // Tamil translations
      },
      'kn': {
        'appTitle': 'CareFinder',
        'welcomeMessage': 'CareFinder ಗೆ ಸ್ವಾಗತ!',
        'emergencyContacts': 'ಎತ್ತರಕ್ಕಿರುವ ಸಂಪರ್ಕಗಳು',
        'profile': 'ಪ್ರೊಫೈಲ್',
        'prescriptions': 'ಪ್ರಿಸ್ಕ್ರಿಪ್ಷನ್ಸ್',
        'settings': 'ಸೆಟ್ಟಿಂಗುಗಳು',
        // Kannada translations
      },
      // Add more languages here
    };
  }

  Locale get locale => _locale;

  void changeLocale(Locale locale) {
    _locale = locale;
  }

  String translate(String key) {
    return _localizedValues[_locale.languageCode]![key] ?? key;
  }

  static LocalizationService of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService)!;
  }
}
