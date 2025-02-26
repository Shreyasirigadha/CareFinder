import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Q: How do I find nearby hospitals?',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'A: You can find nearby hospitals on the home page by clicking on the "Nearby Hospitals" section.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Q: How do I add emergency contacts?',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'A: You can add emergency contacts on the home page by clicking on the "Emergency Contacts" button.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Still have questions? Contact us at carefinder@example.com',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
