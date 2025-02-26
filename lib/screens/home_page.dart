import 'package:flutter/material.dart';
import 'package:senior/screens/prescriptions_page.dart';
import 'package:senior/screens/emergency_contacts_page.dart';
import 'package:senior/screens/first_aid_page.dart';
import 'package:senior/screens/profile_page.dart';
import 'package:senior/screens/settings_page.dart';
import 'package:senior/screens/about_us_page.dart';
import 'package:senior/screens/help_page.dart';
import 'package:senior/screens/hospital_list_page.dart';
import 'package:senior/screens/pharmacy_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CareFinder',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              } else if (value == 'about_us') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              } else if (value == 'help') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              } else if (value == 'first_aid') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstAidPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem<String>(
                  value: 'about_us',
                  child: Text('About Us'),
                ),
                PopupMenuItem<String>(
                  value: 'help',
                  child: Text('Help'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Set background color to white
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Image.asset('assets/images/profile.png',
                              width: 50, height: 50),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : Anne Catherine',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Address: 123 Main St',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Gender: Female',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Blood Group: O+',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Nearby Hospitals section
            _buildSectionTitle('Nearby Hospitals'),
            _buildHorizontalList(hospitalImages, hospitalNames, true),

            // Nearby Pharmacies section
            _buildSectionTitle('Nearby Pharmacies'),
            _buildHorizontalList(pharmacyImages, pharmacyNames, false),

            // Quick Access section
            _buildSectionTitle('Quick Access'),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickAccessButton(
                  context,
                  'Profile',
                  ProfilePage(),
                ),
                SizedBox(height: 10), // Add space between buttons
                _buildQuickAccessButton(
                  context,
                  'Emergency Contacts',
                  EmergencyContactsPage(),
                ),
                SizedBox(height: 10), // Add space between buttons
                _buildQuickAccessButton(
                  context,
                  'Prescriptions',
                  PrescriptionsPage(),
                ),
                SizedBox(height: 10), // Add space between buttons
                _buildQuickAccessButton(
                  context,
                  'First Aid',
                  FirstAidPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHorizontalList(
      List<String> images, List<String> names, bool isHospitalList) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (isHospitalList) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HospitalListPage()),
                );
              } else
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PharmacyListPage()),
                );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 150,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      images[index],
                      width: 120,
                      height: 100,
                    ),
                    SizedBox(height: 4),
                    Text(
                      names[index], // Display hospital/pharmacy name
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickAccessButton(
      BuildContext context, String label, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 20), // Increase font size
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150, 50), // Set a fixed button size
      ),
    );
  }
}

// Sample hospital images
List<String> hospitalImages = [
  'assets/images/hospital1.png',
  'assets/images/hospital2.png',
  'assets/images/hospital3.png',
  // Add more hospital images here if needed
];

// Sample pharmacy images
List<String> pharmacyImages = [
  'assets/images/pharmacy1.png',
  'assets/images/pharmacy2.png',
  'assets/images/pharmacy3.png',
  // Add more pharmacy images here if needed
];

List<String> pharmacyNames = [
  "Marien Pharmacy",
  "Azavedo Pharmacy",
  "Rate Pharmacy",
  // Add more pharmacy images here if needed
];

List<String> hospitalNames = [
  "Chinook Hospital",
  "Yashoda Hospital",
  "Alberta Hospital",
  // Add more pharmacy images here if needed
];
