import 'dart:math';
import 'package:flutter/material.dart';

class Helper {
  static Color getRandomColor() {
    Random rand = Random.secure();
    return Color.fromARGB(
        255, rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));
  }
}
