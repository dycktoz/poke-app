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
      child: CustomGradient(
        colors: const [
          Colors.transparent,
          Color.fromARGB(90, 190, 167, 40), //TODO: cambiar al del tema
        ],
        stops: const [
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

class CustomGradient extends StatelessWidget {
  const CustomGradient({
    super.key,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
    required this.colors,
    this.child,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;
  final Widget? child;

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
