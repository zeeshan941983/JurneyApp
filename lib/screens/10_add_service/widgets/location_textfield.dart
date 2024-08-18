import 'package:flutter/material.dart';

class LocationTextfield extends StatelessWidget {
  const LocationTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.location_searching_rounded),
        hintText: 'Enter your location',
        hintStyle: const TextStyle(color: Colors.black45),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
