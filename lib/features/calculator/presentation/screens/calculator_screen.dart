import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Calculator',
          style: theme.textTheme.titleLarge?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // ── Display panel ──────────────────────────────────────────
            Expanded(
              flex: 3,
              child: _DisplayPanel(colorScheme: cs, theme: theme),
            ),

            // ── Divider ────────────────────────────────────────────────
            Divider(
              height: 1,
              thickness: 1,
              color: cs.outlineVariant.withOpacity(0.4),
              indent: 24,
              endIndent: 24,
            ),

            // ── Button grid ────────────────────────────────────────────
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: _ButtonGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Display Panel
// ─────────────────────────────────────────────────────────────────────────────

class _DisplayPanel extends StatelessWidget {
  const _DisplayPanel({
    required this.colorScheme,
    required this.theme,
  });

  final ColorScheme colorScheme;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // History / expression line
          Text(
            '750 ÷ 3',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.45),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Main result line
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              '250',
              style: theme.textTheme.displayLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w300,
                letterSpacing: -2,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Button Grid — builds rows from static data
// ─────────────────────────────────────────────────────────────────────────────

class _ButtonGrid extends StatelessWidget {
  _ButtonGrid();

  // Pre-split rows: each row is a list of [label, type, flex] triples.
  static const List<List<List<dynamic>>> _rows =
      <List<List<dynamic>>>[
    // Row 1
    [
      ['AC', CalculatorButtonType.function, 1],
      ['+/-', CalculatorButtonType.function, 1],
      ['%', CalculatorButtonType.function, 1],
      ['÷', CalculatorButtonType.operator, 1],
    ],
    // Row 2
    [
      ['7', CalculatorButtonType.number, 1],
      ['8', CalculatorButtonType.number, 1],
      ['9', CalculatorButtonType.number, 1],
      ['×', CalculatorButtonType.operator, 1],
    ],
    // Row 3
    [
      ['4', CalculatorButtonType.number, 1],
      ['5', CalculatorButtonType.number, 1],
      ['6', CalculatorButtonType.number, 1],
      ['−', CalculatorButtonType.operator, 1],
    ],
    // Row 4
    [
      ['1', CalculatorButtonType.number, 1],
      ['2', CalculatorButtonType.number, 1],
      ['3', CalculatorButtonType.number, 1],
      ['+', CalculatorButtonType.operator, 1],
    ],
    // Row 5 — '0' has flex 2
    [
      ['0', CalculatorButtonType.number, 2],
      ['.', CalculatorButtonType.number, 1],
      ['=', CalculatorButtonType.equals, 1],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _rows.map((List<List<dynamic>> row) {
        return Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: row.map((List<dynamic> btn) {
              return CalculatorButton(
                label: btn[0] as String,
                type: btn[1] as CalculatorButtonType,
                flex: btn[2] as int,
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
