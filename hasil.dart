import 'package:flutter/material.dart';
import 'package:assigment/ui/hasil.dart';

class Second extends StatelessWidget {
  final String Fullname;
  final String email;
  final String phoneNumber;
  final String personalID;
  final String address;

  Second({
    required this.Fullname,
    required this.email,
    required this.phoneNumber,
    required this.personalID,
    required this.address,
    required String fullName,
    required String personalId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Fullname),
                Text(email),
                Text(phoneNumber),
                Text(address),
                Text(personalID),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
