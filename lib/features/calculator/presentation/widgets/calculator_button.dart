import 'package:flutter/material.dart';

/// Categorizes each button so the correct color is applied automatically.
enum CalculatorButtonType {
  /// Digits 0-9 and decimal point → surface/onSurface
  number,

  /// +, −, ×, ÷ → secondary container
  operator,

  /// = → primary (accent)
  equals,

  /// AC, +/-, % → tertiary container
  function,
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.label,
    required this.type,
    this.flex = 1,
    this.onTap,
    this.icon,
  });

  /// Text shown on the button (e.g. '7', '+', 'AC').
  final String label;

  /// Controls the background/foreground color group.
  final CalculatorButtonType type;

  /// How many grid columns this button spans (for the '0' wide button).
  final int flex;

  /// Tap callback — intentionally nullable because this is UI-only.
  final VoidCallback? onTap;

  /// Optional icon to show instead of text (currently unused but keeps API open).
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final TextTheme tt = Theme.of(context).textTheme;

    final Color bgColor = _resolveBackground(cs);
    final Color fgColor = _resolveForeground(cs);

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          color: bgColor,
          borderRadius: BorderRadius.circular(64),
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(64),
            onTap: onTap,
            splashColor: fgColor.withOpacity(0.12),
            highlightColor: fgColor.withOpacity(0.08),
            child: SizedBox(
              height: 72,
              child: Center(
                child: icon != null
                    ? Icon(icon, color: fgColor, size: 26)
                    : Text(
                        label,
                        style: tt.titleLarge?.copyWith(
                          color: fgColor,
                          fontWeight: type == CalculatorButtonType.equals
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _resolveBackground(ColorScheme cs) {
    switch (type) {
      case CalculatorButtonType.number:
        return cs.surfaceContainerHighest;
      case CalculatorButtonType.operator:
        return cs.secondaryContainer;
      case CalculatorButtonType.equals:
        return cs.primary;
      case CalculatorButtonType.function:
        return cs.tertiaryContainer;
    }
  }

  Color _resolveForeground(ColorScheme cs) {
    switch (type) {
      case CalculatorButtonType.number:
        return cs.onSurface;
      case CalculatorButtonType.operator:
        return cs.onSecondaryContainer;
      case CalculatorButtonType.equals:
        return cs.onPrimary;
      case CalculatorButtonType.function:
        return cs.onTertiaryContainer;
    }
  }
}
