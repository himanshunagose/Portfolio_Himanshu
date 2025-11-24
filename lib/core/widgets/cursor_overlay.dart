import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/cursor_controller.dart';

/// Adds the floating custom cursor circle above the entire widget tree.
class CursorOverlay extends StatelessWidget {
  const CursorOverlay({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Listener(
          onPointerHover: (event) =>
              context.read<CursorController>().updatePosition(event.localPosition),
          onPointerMove: (event) =>
              context.read<CursorController>().updatePosition(event.localPosition),
          onPointerUp: (_) => context.read<CursorController>().clearHovering(),
          onPointerDown: (_) => context.read<CursorController>().hide(),
          child: MouseRegion(
            opaque: false,
            cursor: SystemMouseCursors.none,
            child: Stack(
              children: [
                child,
                Positioned.fill(
                  child: IgnorePointer(
                    child: Consumer<CursorController>(
                      builder: (_, controller, __) {
                        if (!controller.isVisible) {
                          return const SizedBox.shrink();
                        }
                        final offset = controller.position;
                        final cursorSize = controller.size;

                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 120),
                          curve: Curves.easeOut,
                          left: offset.dx - cursorSize / 2,
                          top: offset.dy - cursorSize / 2,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: cursorSize,
                            height: cursorSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0x994F46E5),
                                  Color(0x990EA5E9),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 20,
                                  spreadRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

