import 'package:flutter/material.dart';
import 'package:ibiza/core/widgets/bubble_message.dart';

class BubbleMessage extends StatelessWidget {
  final String? selectedOption;
  final ValueChanged<String> onOptionSelected;
  final bool istrue;

  const BubbleMessage({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.istrue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomPaint(
        painter: MessageBubblePainter(
          clipper:
              MessageBubbleClipper(tailOffset: istrue == true ? 250.0 : 100),
          borderColor: const Color(0xffD6D6D6),
          borderWidth: 1.0,
        ),
        child: ClipPath(
          clipper: MessageBubbleClipper(tailOffset: istrue ? 250.0 : 100),
          child: SizedBox(
            height: 70,
            width: double.infinity,
            child: Row(
              children: [
                const SizedBox(width: 20),
                buildOption("Walking"),
                buildOption("With Boat"),
                buildOption("With Vehicle"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOption(String title) {
    final isSelected = selectedOption == title;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        height: 34,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xffD6D6D6)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: isSelected ? Colors.grey.shade200 : Colors.white,
          ),
          onPressed: () => onOptionSelected(title),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
