import 'package:flutter/material.dart';
import 'package:material/component/text_style.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Expanded(
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 7),

          TextStyleExample(name: "About", style: textTheme.titleLarge!),
          TextStyleExample(name: "A framework for building beautiful, natively compiled applications from a single codebase. Support is in progress for Material Design 3.", style: textTheme.titleMedium!),
          TextStyleExample(name: "The latest from Material for Flutter", style: textTheme.titleSmall!),

        ],
      ),
    );
  }
}

