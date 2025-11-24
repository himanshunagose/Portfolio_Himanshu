import 'dart:ui';

import 'package:flutter/material.dart';

/// Global custom cursor state used for the floating circle on web.
class CursorController extends ChangeNotifier {
  Offset _position = Offset.zero;
  double _size = 18;
  double _targetSize = 18;
  bool _visible = false;

  Offset get position => _position;
  double get size => _size;
  bool get isVisible => _visible;

  void updatePosition(Offset offset) {
    _position = offset;
    _visible = true;
    _animate();
  }

  void hide() {
    _visible = false;
    notifyListeners();
  }

  void setHovering({double scale = 1.8}) {
    _targetSize = 18 * scale;
    _animate();
  }

  void clearHovering() {
    _targetSize = 18;
    _animate();
  }

  void _animate() {
    _size = lerpDouble(_size, _targetSize, 0.4) ?? _targetSize;
    notifyListeners();
  }
}

