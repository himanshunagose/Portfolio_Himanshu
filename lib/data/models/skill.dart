import 'package:flutter/material.dart';

class Skill {
  const Skill({
    required this.label,
    required this.description,
    required this.value,
    required this.icon,
  });

  final String label;
  final String description;
  final double value;
  final IconData icon;
}


