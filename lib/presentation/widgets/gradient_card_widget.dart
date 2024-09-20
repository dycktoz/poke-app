import 'package:flutter/material.dart';

class GradientCardWidget extends StatelessWidget {
  const GradientCardWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: _CustomGradient(
        colors: [
          Colors.transparent,
          Color.fromARGB(255, 97, 97, 97), //TODO: cambiar al del tema
        ],
        stops: [
          0.0,
          1.0,
        ],
        end: Alignment.bottomRight,
        begin: Alignment.topLeft,
        child: child,
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  const _CustomGradient({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
    required this.colors,
    required this.child,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
        child: child,
      ),
    );
  }
}
