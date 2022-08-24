import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticonface;

  const EmoticonFace({
    Key? key,
    required this.emoticonface,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          emoticonface,
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}