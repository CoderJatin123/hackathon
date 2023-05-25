import 'package:flutter/material.dart';

import '../../main.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    
    // Perform form validation or further processing
    // Here, you can access the 'name', 'email', and '_selectedCategory' variables

    // Example: Print the form data
    print('Name: $name');
    print('Email: $email');
    Navigator.of(context).pushReplacement(
    MaterialPageRoute( builder: (context)=>const MyHomePage()));
  
  }

  void _cancelForm() {
    // Clear form fields
    _nameController.clear();
    _emailController.clear();
   

    // Perform any additional actions on cancel

    // Example: Print cancel message
    print('Form cancelled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email ID:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
    
            
            Row(
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _cancelForm,
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
