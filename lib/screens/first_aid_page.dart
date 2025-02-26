import 'package:flutter/material.dart';

class FirstAidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFirstAidSection(
              'Cardiopulmonary Resuscitation (CPR)',
              'To perform CPR:\n1. Place the person on their back on a firm surface.\n2. Kneel next to the person’s neck and shoulders.\n3. Put the heel of one hand on the center of the person’s chest, between the nipples.\n4. Place the other hand on top of the first hand.\n5. Keep your elbows straight and position your shoulders directly above your hands.\n6. Push down on the person’s chest hard and fast, at least 2 inches deep and at a rate of at least 100 compressions per minute.\n7. Continue CPR until help arrives.'
            ),
            SizedBox(height: 20.0),
            _buildFirstAidSection(
              'Cough and Cold',
              'For cough and cold:\n1. Drink plenty of fluids.\n2. Get plenty of rest.\n3. Use over-the-counter cold medications as needed.\n4. Use a humidifier or take a hot shower to relieve congestion.\n5. Gargle with salt water to soothe a sore throat.\n6. Use throat lozenges or cough drops.'
            ),
            // Add more first aid sections as needed
          ],
        ),
      ),
    );
  }

  Widget _buildFirstAidSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(content),
        Divider(),
      ],
    );
  }
}
