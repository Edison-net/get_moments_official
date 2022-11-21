import 'package:flutter/material.dart';

class Backgroundcolor extends StatelessWidget {
  final Widget child;
  const Backgroundcolor({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFA9FAFF),
            Color(0xA200A3FF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: child,
    );
  }
}
