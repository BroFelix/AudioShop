import 'package:flutter/material.dart';

class LineDecoration extends Decoration {
  final BoxPainter _painter;

  LineDecoration({required Color color, required double width, required double thickness})
      : _painter = _LinePainter(color, width, thickness);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _LinePainter extends BoxPainter {
  final Paint _paint;
  final double width;

  _LinePainter(Color color, this.width, double thickness)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true
          ..strokeCap = StrokeCap.round
          ..strokeWidth = thickness;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    _paint.style = PaintingStyle.stroke;
    canvas.drawLine(
      offset + Offset(configuration.size!.width / 2 - width, configuration.size!.height),
      offset + Offset(configuration.size!.width / 2 + width, configuration.size!.height),
      _paint,
    );
  }
}
