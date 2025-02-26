import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DisplaySettingsPage extends StatefulWidget {
  @override
  _DisplaySettingsPageState createState() => _DisplaySettingsPageState();
}

class _DisplaySettingsPageState extends State<DisplaySettingsPage> {
  double brightnessValue = 0.5;
  String selectedTheme = 'Light';
  double selectedFontSize = 16.0;
  String selectedFontStyle = 'Normal';
  Color selectedFontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSubHeading('Brightness'),
          _buildBrightnessSlider(),
          _buildSubHeading('Theme'),
          _buildThemeDropdown(),
          _buildSubHeading('Font Size'),
          _buildFontSizeSlider(),
          _buildSubHeading('Font Style'),
          _buildFontStyleDropdown(),
          _buildSubHeading('Font Color'),
          _buildFontColorPicker(),
        ],
      ),
    );
  }

  Widget _buildSubHeading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBrightnessSlider() {
    return Slider(
      value: brightnessValue,
      onChanged: (value) {
        setState(() {
          brightnessValue = value;
        });
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: 'Brightness',
    );
  }

  Widget _buildThemeDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedTheme,
      items: ['Light', 'Dark']
          .map((theme) => DropdownMenuItem(
                value: theme,
                child: Text(theme),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedTheme = value!;
        });
      },
      decoration: InputDecoration(labelText: 'Theme'),
    );
  }

  Widget _buildFontSizeSlider() {
    return Slider(
      value: selectedFontSize,
      onChanged: (value) {
        setState(() {
          selectedFontSize = value;
        });
      },
      min: 10.0,
      max: 30.0,
      divisions: 20,
      label: 'Font Size',
    );
  }

  Widget _buildFontStyleDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedFontStyle,
      items: ['Normal', 'Italic', 'Bold']
          .map((style) => DropdownMenuItem(
                value: style,
                child: Text(style),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedFontStyle = value!;
        });
      },
      decoration: InputDecoration(labelText: 'Font Style'),
    );
  }

  Widget _buildFontColorPicker() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select Font Color'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: selectedFontColor,
                  onColorChanged: (color) {
                    setState(() {
                      selectedFontColor = color;
                    });
                  },
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text('Select Font Color'),
    );
  }
}
