import 'package:flutter/material.dart';

class AppWindow {
  static const Size fixedSize = Size(400, 800);
}

class AppThemeTokens {
  static const Color darkBackgroundColor = Color(0xFF121212);
}

class AppLayout {
  static const double contentMaxWidth = 600;
  static const double pagePadding = 16;
  static const double cardRadius = 16;
  static const double bottomButtonHeight = 60;
  static const EdgeInsets bottomBarInsets = EdgeInsets.fromLTRB(16, 8, 16, 16);
  static const double smallSpacing = 8;
  static const double mediumSpacing = 12;
  static const double largeSpacing = 24;
  static const double itemDescriptionSpacing = 4;
  static const double counterButtonSize = 72;
  static const double counterIconSize = 54;
  static const double counterHorizontalInset = 8;
  static const double selectedBorderWidth = 1.4;
  static const double loadingIndicatorSize = 18;
  static const double loadingIndicatorStrokeWidth = 2;
}

class AppTiming {
  static const Duration sessionTick = Duration(seconds: 1);
  static const Duration mockSaveDelay = Duration(milliseconds: 500);
}
