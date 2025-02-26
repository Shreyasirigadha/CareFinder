import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildFormField('Name', _nameController),
              _buildFormField('Age', _ageController),
              _buildFormField('Address', _addressController),
              _buildFormField('Gender', _genderController),
              _buildFormField('Blood Group', _bloodGroupController),
              _buildFormField('Email', _emailController),
              _buildFormField('Phone Number', _phoneController),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _saveForm();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Profile saved successfully!'),
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

  Widget _buildFormField(String label, TextEditingController controller) {
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
      enabled: _isEditing,
    );
  }

  void _saveForm() {
    // Save the form data
    // You can save the data to a database or any other storage mechanism
  }

  void _clearForm() {
    // Clear the form fields
    _nameController.clear();
    _ageController.clear();
    _addressController.clear();
    _genderController.clear();
    _bloodGroupController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  void dispose() {
    // Clean up the controllers
    _nameController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    _genderController.dispose();
    _bloodGroupController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
