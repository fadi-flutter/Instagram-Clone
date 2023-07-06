import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  final bool showHeart;

  const HeartWidget({super.key, required this.showHeart});

  @override
  // ignore: library_private_types_in_public_api
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(HeartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showHeart && !oldWidget.showHeart) {
      _animationController.forward();
    } else if (!widget.showHeart && oldWidget.showHeart) {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: const Icon(
            Icons.favorite,
            size: 70,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
