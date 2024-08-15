import 'dart:ui';

import 'package:flutter/material.dart';

class MessageBubbleClipper extends CustomClipper<Path> {
  final double tailOffset;
  MessageBubbleClipper({
    required this.tailOffset,
  });
  @override
  Path getClip(Size size) {
    final path = Path();

    const double tailWidth = 30.0;
    const double tailHeight = 10.0;
    // const double tailOffset = 250.0;
    const double borderRadius = 20.0;

    // Receiver's tail with `tailOffset`
    final double tailStartX = size.width - tailOffset;
    final double tailEndX = tailStartX - tailWidth;

    // Start path with rounded corners
    path.moveTo(size.width - borderRadius, 0); // Top-right corner (rounded)
    path.arcToPoint(
      Offset(size.width, borderRadius),
      radius: const Radius.circular(borderRadius),
    ); // Top-right corner arc

    path.lineTo(size.width, size.height - borderRadius); // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - borderRadius, size.height),
      radius: const Radius.circular(borderRadius),
    ); // Bottom-right corner arc

    path.lineTo(borderRadius, size.height); // Bottom-left corner
    path.arcToPoint(
      Offset(0, size.height - borderRadius),
      radius: const Radius.circular(borderRadius),
    ); // Bottom-left corner arc

    path.lineTo(0, borderRadius); // Top-left corner
    path.arcToPoint(
      const Offset(borderRadius, 0),
      radius: const Radius.circular(borderRadius),
    ); // Top-left corner arc

    path.lineTo(tailEndX, 0); // Tail end point
    path.lineTo(tailStartX - (tailWidth / 2), -tailHeight); // Arrow tip
    path.lineTo(tailStartX, 0); // Back to tail start point
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper is MessageBubbleClipper;
  }
}

class MessageBubblePainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final Color borderColor;
  final double borderWidth;

  MessageBubblePainter({
    required this.clipper,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = clipper.getClip(size);

    // Paint the border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, borderPaint);

    // Paint the fill color (if needed)
    final fillPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
