import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/core/widgets/show_all_button.dart';
import 'package:ibiza/screens/05_details_screen/models/reviews_model.dart';
import 'package:ibiza/screens/05_details_screen/sections/details_section4.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            reviews.length,
            (index) {
              final review = reviews[index];
              return ReviewBox(review: review)
                  .withPadding(padding: EdgeInsets.symmetric(vertical: 10.h));
            },
          ),
          ShowAllButton(text: 'Show All ${reviews.length} reviews'),
        ],
      ),
    );
  }
}
