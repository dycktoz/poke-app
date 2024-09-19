import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoScreen extends ConsumerWidget {
  const InfoScreen({
    required this.pokeId,
    super.key,
  });

  final String pokeId;

  static const name = 'info-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
