import 'package:flutter/material.dart';
import 'language_selection_page.dart';
import 'display_settings_page.dart'; 

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSettingsItem(context, 'Display', DisplaySettingsPage()), 
          _buildSettingsItem(context, 'Language Support',
              LanguageSelectionPage()),
          _buildSettingsItem(context, 'Notifications', NotificationsPage()),
          _buildSettingsItem(context, 'Privacy', PrivacyPage()),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications Page'),
      ),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      body: Center(
        child: Text('Privacy Page'),
      ),
    );
  }
}
// NotificationsPage and PrivacyPage remain unchanged
