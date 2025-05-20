import 'package:flutter/material.dart';

class RegistrationFormPage extends StatefulWidget {
  @override
  _RegistrationFormPageState createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedEvent;
  String? _selectedTime;
  bool _acceptedTerms = false;

  final List<String> _events = ['Workshop', 'Seminar', 'Bootcamp'];
  final List<String> _timeSlots = ['Morning', 'Afternoon', 'Evening'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event Registration")),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1522199710521-72d69614c702',
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.4)),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextField("Full Name", _nameController, Icons.person),
                  buildTextField("Email Address", _emailController, Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Enter email';
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        return emailRegex.hasMatch(value) ? null : 'Enter valid email';
                      }),
                  buildTextField("Phone Number", _phoneController, Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Enter phone';
                        final phoneRegex = RegExp(r'^[0-9]{10,13}$');
                        return phoneRegex.hasMatch(value)
                            ? null
                            : 'Enter 10–13 digit phone number';
                      }),

                  // Dropdown for Event
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select Event',
                        prefixIcon: Icon(Icons.event_available),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      items: _events
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      value: _selectedEvent,
                      onChanged: (val) => setState(() => _selectedEvent = val),
                      validator: (value) =>
                      value == null ? 'Please select an event' : null,
                    ),
                  ),

                  // Radio for Time Slot
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Preferred Time Slot',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  ..._timeSlots.map((slot) {
                    return RadioListTile<String>(
                      title: Text(slot, style: TextStyle(color: Colors.white)),
                      value: slot,
                      groupValue: _selectedTime,
                      onChanged: (val) => setState(() => _selectedTime = val),
                    );
                  }).toList(),
                  if (_selectedTime == null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Please select a time slot',
                          style: TextStyle(color: Colors.red[300], fontSize: 12)),
                    ),

                  // Checkbox
                  CheckboxListTile(
                    title: Text("I accept Terms and Conditions",
                        style: TextStyle(color: Colors.white)),
                    value: _acceptedTerms,
                    onChanged: (val) => setState(() => _acceptedTerms = val ?? false),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (!_acceptedTerms)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('You must accept the terms',
                          style: TextStyle(color: Colors.red[300], fontSize: 12)),
                    ),

                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.check),
                    label: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, IconData icon,
      {TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: validator ??
                (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  void _submitForm() {
    final valid = _formKey.currentState?.validate() ?? false;
    final timeSelected = _selectedTime != null;
    final accepted = _acceptedTerms;

    if (valid && timeSelected && accepted) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Success"),
          content: Text("Thank you! You have successfully registered for the Event!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      setState(() {}); // Refresh to show error messages
    }
  }
}
