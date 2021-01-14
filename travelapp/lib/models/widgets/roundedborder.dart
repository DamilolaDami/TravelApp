import 'package:flutter/material.dart';

class RoundedRectangularTabIndicator extends Decoration {
  final BoxPainter _painter;
  RoundedRectangularTabIndicator({
    @required Color color,
    @required double weight,
    @required double width,
  }) : _painter = _RRectangularPainterColor(color, weight, width);
  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _RRectangularPainterColor extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;

  _RRectangularPainterColor(Color color, this.weight, this.width)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset customOffset = offset +
        Offset(cfg.size.width / 2 - (width * 0.5), cfg.size.height - weight);
    Rect myRect = customOffset & Size(width, weight);
    RRect myRRect = RRect.fromRectXY(myRect, weight, weight);
    canvas.drawRRect(myRRect, _paint);
  }
}
