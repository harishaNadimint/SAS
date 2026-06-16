import 'package:flutter/material.dart';

class BuddyWidget extends StatelessWidget {
  final bool isHappy;

  const BuddyWidget({
    super.key,
    this.isHappy = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: CircleAvatar(
        radius: 70,
        backgroundColor:
            isHappy ? Colors.green.shade100 : Colors.blue.shade100,
        child: Text(
          isHappy ? "🤖🎉" : "🤖",
          style: const TextStyle(fontSize: 70),
        ),
      ),
    );
  }
}