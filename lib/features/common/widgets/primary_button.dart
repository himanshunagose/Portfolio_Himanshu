import 'package:flutter/material.dart';

import '../../../core/widgets/cursor_region.dart';

enum ButtonVariant { primary, ghost }

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = ButtonVariant.primary,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final ButtonVariant variant;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> with SingleTickerProviderStateMixin {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = widget.variant == ButtonVariant.primary
        ? theme.colorScheme.primary
        : theme.colorScheme.surface.withOpacity(0.2);
    final foreground = widget.variant == ButtonVariant.primary
        ? Colors.white
        : theme.colorScheme.onSurface.withOpacity(0.9);

    return CursorRegion(
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, hover ? -4.0 : 0.0)
            ..scale(hover ? 1.02 : 1.0),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(20),
            border: widget.variant == ButtonVariant.primary
                ? null
                : Border.all(
                    color: theme.colorScheme.onSurface.withOpacity(0.1),
                  ),
            boxShadow: [
              if (hover)
                BoxShadow(
                  color: background.withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(0, 14),
                ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: widget.onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(widget.icon, color: foreground),
                      const SizedBox(width: 10),
                    ],
                    Text(
                      widget.label,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: foreground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

