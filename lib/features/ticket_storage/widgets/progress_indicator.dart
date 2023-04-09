import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressIndicatorWithBlur extends StatelessWidget {
  const ProgressIndicatorWithBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Theme.of(context).colorScheme.background.withOpacity(0.2),
          ),
        ),
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
