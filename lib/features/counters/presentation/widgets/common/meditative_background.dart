import 'package:flutter/material.dart';

class MeditativeBackground extends StatelessWidget {
  final Widget child;

  const MeditativeBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ocean_bg.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withValues(alpha: 0.08),
              Colors.white.withValues(alpha: 0.14),
              Colors.white.withValues(alpha: 0.10),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
