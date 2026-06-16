import 'dart:math';
import 'package:flutter/material.dart';

class FlipStoryCard extends StatefulWidget {
  final Widget front;
  final Widget back;

  const FlipStoryCard({
    super.key,
    required this.front,
    required this.back,
  });

  @override
  State<FlipStoryCard> createState() => _FlipStoryCardState();
}

class _FlipStoryCardState extends State<FlipStoryCard> {
  bool isFront = true;

  void flip() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: flip,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        transitionBuilder: (child, animation) {
          final rotate = Tween(
            begin: pi,
            end: 0.0,
          ).animate(animation);

          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(rotate.value),
                child: child,
              );
            },
          );
        },
        child: isFront
            ? Container(
                key: const ValueKey('front'),
                child: widget.front,
              )
            : Container(
                key: const ValueKey('back'),
                child: widget.back,
              ),
      ),
    );
  }
}