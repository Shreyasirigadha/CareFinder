import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/loading_page.dart';
import 'screens/home_page.dart';
import 'screens/emergency_contacts_page.dart';
import 'screens/prescriptions_page.dart';
import 'screens/first_aid_page.dart';
import 'screens/profile_page.dart';
import 'services/localization_service.dart';
import 'services/localization_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocalizationService().translate('appTitle'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFE9D4F4), // Light purple background color
      ),
      localizationsDelegates: const [
        LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/emergency_contacts': (context) => EmergencyContactsPage(),
        '/prescriptions': (context) => PrescriptionsPage(),
        '/first_aid': (context) => FirstAidPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
