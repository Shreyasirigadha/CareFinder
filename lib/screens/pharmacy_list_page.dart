import 'package:flutter/material.dart';

class PharmacyListPage extends StatelessWidget {
  final List<Pharmacy> pharmacies = [
    Pharmacy(
      name: 'Marien Pharmacy',
      address: '789 Oak St',
      rating: 4.0,
      imageAssetsPath: 'assets/images/pharmacy1.png',
    ),
    Pharmacy(
      name: 'Azavedo Pharmacy',
      address: '101 Pine St',
      rating: 4.3,
      imageAssetsPath: 'assets/images/pharmacy2.png',
    ),
    Pharmacy(
      name: 'Rate Pharmacy',
      address: '101 Pine St',
      rating: 4.3,
      imageAssetsPath: 'assets/images/pharmacy3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Pharmacies'),
      ),
      body: ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          return PharmacyCard(pharmacy: pharmacies[index]);
        },
      ),
    );
  }
}

class Pharmacy {
  final String name;
  final String address;
  final double rating;
  final String imageAssetsPath;

  Pharmacy({
    required this.name,
    required this.address,
    required this.rating,
    required this.imageAssetsPath,
  });
}

class PharmacyCard extends StatelessWidget {
  final Pharmacy pharmacy;

  const PharmacyCard({Key? key, required this.pharmacy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              pharmacy.imageAssetsPath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              pharmacy.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              pharmacy.address,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(pharmacy.rating.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
