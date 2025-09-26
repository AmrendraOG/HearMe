import 'package:flutter/material.dart';

class TextBubbles extends StatelessWidget {
  const TextBubbles({
    super.key,
    required this.message,
    required this.day,
    required this.time,
  });

  final String message;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff696FC7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(day, style: TextStyle(color: Colors.white60)),
                  Text(time, style: TextStyle(color: Colors.white60)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
