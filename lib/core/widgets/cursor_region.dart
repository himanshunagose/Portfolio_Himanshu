import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/cursor_controller.dart';

/// Wraps hoverable elements so the cursor circle can react to state changes.
class CursorRegion extends StatelessWidget {
  const CursorRegion({
    super.key,
    required this.child,
    this.expandScale = 2.4,
  });

  final Widget child;
  final double expandScale;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => context.read<CursorController>().setHovering(
            scale: expandScale,
          ),
      onExit: (_) => context.read<CursorController>().clearHovering(),
      child: child,
    );
  }
}

