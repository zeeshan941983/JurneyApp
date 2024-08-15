import 'package:flutter/material.dart';
import 'package:ibiza/core/widgets/bubble_message.dart';

class BubbleMessage extends StatelessWidget {
  final bool istrue;
  const BubbleMessage({
    super.key,
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
              mainAxisSize: MainAxisSize.min,
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
            backgroundColor: Colors.white,
            // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          ),
          onPressed: () {},
          child: Text(
            title,
            style: const TextStyle(color: Color(0xff222222), fontSize: 13),
          ),
        ),
      ),
    );
  }
}
