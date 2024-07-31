import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        16.ph,
          const Text(
            'Welcome Back Hugo Carretero',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
           16.ph,
          const Card(
            child: ListTile(
              title: Text('Verify your identify'),
              subtitle: Text('Required to publish\nService title'),
              trailing: Icon(Icons.arrow_forward),
              isThreeLine: true,
            ),
          ),
            16.ph,
          const Text(
            'Your reservations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
           8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildReservationButton('Checking out (0)', true),
              8.pw,
              _buildReservationButton('Currently Hosting (0)', false),
          
            ],
          ),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 _buildReservationButton('Upcoming (0)', false),
                  8.pw,
              _buildReservationButton('Pending reviews (0)', false),
          
            ],
          ),
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment, size: 50, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'You don\'t have any guests\nchecking out today or tomorrow',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationButton(String text, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        side: const BorderSide(color: Colors.black),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
