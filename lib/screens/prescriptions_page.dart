import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionsPage extends StatefulWidget {
  @override
  _PrescriptionsPageState createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  List<XFile> _prescriptionImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _prescriptionImages.add(pickedFile);
      });
    }
  }

  Future<void> _uploadPicture() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _prescriptionImages.add(pickedFile);
      });
    }
  }

  Future<void> _deletePicture(int index) async {
    setState(() {
      _prescriptionImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescriptions'),
      ),
      body: ListView.builder(
        itemCount: _prescriptionImages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildButtonRow();
          } else {
            return _buildImageRow(index - 1);
          }
        },
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _takePicture,
          child: Text('Take Picture'),
        ),
        ElevatedButton(
          onPressed: _uploadPicture,
          child: Text('Upload Picture'),
        ),
      ],
    );
  }

  Widget _buildImageRow(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.file(
          File(_prescriptionImages[index].path),
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () => _deletePicture(index),
            child: Text('Delete'),
          ),
        ),
        Divider(),
      ],
    );
  }
}
