import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

extension NavExts on BuildContext {
  void push(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

  void pop() {
    Navigator.pop(this);
  }

  void replace(Widget screen) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;
}

extension WidgetExts on Widget {
  Widget padX(double size) => Padding(
        padding: EdgeInsets.symmetric(horizontal: size),
        child: this,
      );

  Widget padY(double size) => Padding(
        padding: EdgeInsets.symmetric(vertical: size),
        child: this,
      );

  Widget padAll(double size) => Padding(
        padding: EdgeInsets.all(size),
        child: this,
      );

  Widget centeralize() => Center(
        child: this,
      );
}


extension StringExts on String {
  String get captializeFirst => this[0].toUpperCase() + substring(1);
}

extension GeopointExt on GeoPoint {

  String toStringg() {
    return '$latitude $longitude';
  }
}