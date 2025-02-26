import 'package:flutter/material.dart';

class Hospital {
  final String name;
  final String address;
  final double rating;
  final String imageAssetPath; 

  Hospital({
    required this.name,
    required this.address,
    required this.rating,
    required this.imageAssetPath, 
  });
}

class HospitalCard extends StatelessWidget {
  final Hospital hospital;

  const HospitalCard({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              hospital.imageAssetPath, 
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              hospital.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              hospital.address,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text(hospital.rating.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalListPage extends StatelessWidget {
  final List<Hospital> hospitals = [
    Hospital(
      name: 'Chinook Hospital',
      address: '123 Main St',
      rating: 4.5,
      imageAssetPath: 'assets/images/hospital1.png', 
    ),
    Hospital(
      name: 'Yashoda Hospital',
      address: '456 Elm St',
      rating: 4.2,
      imageAssetPath: 'assets/images/hospital2.png', 
    ),
    Hospital(
      name: 'Alberta Hospital',
      address: '678 Tur St',
      rating: 4.1,
      imageAssetPath: 'assets/images/hospital3.png', 
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Hospitals'),
      ),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return HospitalCard(hospital: hospitals[index]);
        },
      ),
    );
  }
}