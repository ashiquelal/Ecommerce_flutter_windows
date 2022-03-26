import 'package:flutter/material.dart';

BuildContext context = context;

class pageView {
  static double base() {
    double screenHeight = MediaQuery.of(context).size.height;
    double pageView = screenHeight / 2.64;
    return pageView;
  }

  static double viewportFraction() {
    double screenWidth = MediaQuery.of(context).size.width;
    double pageView = (354.28 / screenWidth) * 0.85;
    return pageView;
  }

  static double Container() {
    double screenHeight = MediaQuery.of(context).size.height;
    double pageViewContainer = screenHeight / 3.84;
    return pageViewContainer;
  }

  static double ContainerText() {
    double screenHeight = MediaQuery.of(context).size.height;
    double pageViewContainer = screenHeight / 7.03;
    return pageViewContainer;
  }
}

double height(value) {
  double screenHeight = MediaQuery.of(context).size.height;
  double pageViewContainer = (screenHeight / 844) * value;
  return pageViewContainer;
}

double radius(value) {
  double screenHeight = MediaQuery.of(context).size.height;
  double pageViewContainer = (screenHeight / 844) * value;
  return pageViewContainer;
}

double width(value) {
  double screenWidth = MediaQuery.of(context).size.width;
  double pageViewContainer = (screenWidth / 353.6) * value;
  return pageViewContainer;
}

double fontSize(value) {
  double screenHeight = MediaQuery.of(context).size.height;
  double pageViewContainer = (screenHeight / 844) * value;
  return pageViewContainer;
}
