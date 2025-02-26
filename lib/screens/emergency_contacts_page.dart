// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class EmergencyContactsPage extends StatefulWidget {
  @override
  _EmergencyContactsPageState createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _contact1NameController = TextEditingController();
  TextEditingController _contact1PhoneController = TextEditingController();
  TextEditingController _contact1RelationController = TextEditingController();
  TextEditingController _contact2NameController = TextEditingController();
  TextEditingController _contact2PhoneController = TextEditingController();
  TextEditingController _contact2RelationController = TextEditingController();
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactFormField(
                'Emergency Contact Name 1',
                _contact1NameController,
              ),
              _buildContactFormField(
                'Phone Number 1',
                _contact1PhoneController,
              ),
              _buildContactFormField(
                'Relation 1',
                _contact1RelationController,
              ),
              _buildContactFormField(
                'Emergency Contact Name 2',
                _contact2NameController,
              ),
              _buildContactFormField(
                'Phone Number 2',
                _contact2PhoneController,
              ),
              _buildContactFormField(
                'Relation 2',
                _contact2RelationController,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the form data
                    // You can save the data to a database or any other storage mechanism
                    _saveForm();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Emergency contacts saved successfully!'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20.0),
              if (_isEditing)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Clear the form
                        _clearForm();
                      },
                      child: Text('Clear'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle editing mode
          setState(() {
            _isEditing = !_isEditing;
          });
        },
        child: Icon(_isEditing ? Icons.done : Icons.edit),
      ),
    );
  }

  Widget _buildContactFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  void _saveForm() {
    // Save the form data
    // You can save the data to a database or any other storage mechanism
  }

  void _clearForm() {
    // Clear the form fields
    _contact1NameController.clear();
    _contact1PhoneController.clear();
    _contact1RelationController.clear();
    _contact2NameController.clear();
    _contact2PhoneController.clear();
    _contact2RelationController.clear();
  }

  @override
  void dispose() {
    // Clean up the controllers
    _contact1NameController.dispose();
    _contact1PhoneController.dispose();
    _contact1RelationController.dispose();
    _contact2NameController.dispose();
    _contact2PhoneController.dispose();
    _contact2RelationController.dispose();
    super.dispose();
  }
}
