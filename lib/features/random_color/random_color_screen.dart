import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorScreen extends StatefulWidget {
  const RandomColorScreen({super.key});

  @override
  State<RandomColorScreen> createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {
  final Random _random = Random();
  Color _color = Colors.white;

  void _changeColor() {
    setState(() {
      _color = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: ColoredBox(
        color: _color,
        child: const Center(
          child: Text(
            'Hello there',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
