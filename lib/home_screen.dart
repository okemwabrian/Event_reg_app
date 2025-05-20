import 'package:flutter/material.dart';
import 'registration_form_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://cdn.prod.website-files.com/5d6360f5a93ad9d0fbd31a8a/64f88601332495b34baaa843_Dream%20Center%201st%20Class%20(1).jpg',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to the TechSkills360 Event',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text('Register Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RegistrationFormPage()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
