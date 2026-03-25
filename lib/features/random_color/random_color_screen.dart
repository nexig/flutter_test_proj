import 'package:flutter/material.dart';
import 'package:flutter_test_proj/features/random_color/color_generator.dart';

class RandomColorScreen extends StatefulWidget {
  const RandomColorScreen({super.key});

  @override
  State<RandomColorScreen> createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {
  final ColorGenerator _generator = ColorGenerator();
  Color _color = Colors.white;

  void _changeColor() {
    setState(() {
      _color = _generator.generate();
    });
  }

  String _toHex(Color color) {
    final hex = color
        .toARGB32()
        .toRadixString(16)
        .padLeft(8, '0')
        .toUpperCase();

    return '#$hex';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello there',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'RGB('
                '${(_color.r * 255).round()}, '
                '${(_color.g * 255).round()}, '
                '${(_color.b * 255).round()})',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                _toHex(_color),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
