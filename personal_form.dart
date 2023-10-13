import 'package:flutter/material.dart';

import 'hasil.dart';

class PersonalForm extends StatefulWidget {
  const PersonalForm({Key? key}) : super(key: key);

  @override
  _PersonalFormState createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _personalIdController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;
  bool _verifyValue = false;
  bool _checkBoxValue1 = false; // Memindahkan deklarasi _checkBoxValue1 ke sini

  void _showSubmittedData() {
    final fullName = _fullNameController.text;
    final email = _emailController.text;
    final phoneNumber = _phoneNumberController.text;
    final personalId = _personalIdController.text;
    final address = _addressController.text;
    final date = _dateController.text;
    Text(
        'Date: ${_selectedDate == null ? 'Not selected' : _selectedDate!.toLocal().toString()}');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submitted Data'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Full Name: $fullName'),
              Text('Email: $email'),
              Text('Phone Number: $phoneNumber'),
              Text('Verify: ${_verifyValue ? 'Verified' : 'Not Verified'}'),
              Text('Personal ID Number: $personalId'),
              Text('Address: $address'),
              Text('Date: $date'),
              Text('Option 1 Checked: $_checkBoxValue1'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman Second dengan membawa data hasil input
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Second(
                      fullName: fullName,
                      email: email,
                      phoneNumber: phoneNumber,
                      address: address,
                      personalId: personalId,
                      Fullname: '',
                      personalID: '',
                    ),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Form',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildLabelLeftAligned("Full Name"),
            _buildTextField(
                "Enter Full Name", _fullNameController), // Perbaikan teks hint
            _buildLabelLeftAligned("Email"),
            _buildTextField("Enter your Email", _emailController),
            Row(
              children: [
                Expanded(
                  child: _buildTextField("Enter Phone Number",
                      _phoneNumberController), // Perbaikan teks hint
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Verify'),
                    value: _verifyValue,
                    onChanged: (value) {
                      setState(() {
                        _verifyValue = value ?? false;
                      });
                    },
                  ),
                ),
              ],
            ),
            _buildLabelLeftAligned("Personal ID Number"),
            _buildTextField("Enter Personal ID",
                _personalIdController), // Perbaikan teks hint
            _buildLabelLeftAligned("Address"),
            _buildTextField("Enter your Address",
                _addressController), // Perbaikan teks hint
            _buildLabelLeftAligned("Choose a Date"),
            _buildDateTextField(), // Perbaikan teks hint
            _buildCheckboxList(),
            ElevatedButton(
              onPressed: () {
                _showSubmittedData();
                // Handle form submission here
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildDateTextField() {
    return ListTile(
      title: Text(_selectedDate == null
          ? 'Select Date'
          : 'Selected Date: ${_selectedDate!.toLocal()}'),
      trailing:
          Icon(Icons.calendar_today), // Ganti dengan ikon kalender yang sesuai
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
    );
  }

  Widget _buildLabelLeftAligned(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelLeftAligned("Select Options"),
        CheckboxListTile(
          title: Text(
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content."),
          value: _checkBoxValue1,
          onChanged: (value) {
            setState(() {
              _checkBoxValue1 = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
