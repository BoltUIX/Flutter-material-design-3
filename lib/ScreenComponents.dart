import 'package:flutter/material.dart';
import 'package:material/component/text_style.dart';

class ScreenComponents extends StatelessWidget {
  const ScreenComponents({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Expanded(
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 7),

          TextStyleExample(name: "Sample Components", style: textTheme.titleLarge!),
          TextStyleExample(name: "A framework for building beautiful, natively compiled applications from a single codebase. Support is in progress for Material Design 3.", style: textTheme.titleMedium!),
          TextStyleExample(name: "The latest from Material for Flutter", style: textTheme.titleSmall!),

          Row(
            children: const <Widget>[
              Spacer(),
              ButtonsWithoutIcon(isDisabled: true),
              Spacer(),
            ],
          ),

          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}


class ButtonsWithoutIcon extends StatelessWidget {
  final bool isDisabled;

  const ButtonsWithoutIcon({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return

      IntrinsicWidth(
        child:

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {  },
              child: const Text("Elevated"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Foreground color
                foregroundColor: Theme.of(context).colorScheme.onPrimary, backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {  },
              child: const Text('Filled'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Foreground color
                foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer, backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {  },
              child: const Text('Filled Tonal'),
            ),
            OutlinedButton(
              onPressed: () {  },
              child: const Text("Outlined"),
            ),
            TextButton(
                onPressed: () {  },
                child: const Text("Text")),

          ],
        ),

      );
  }
}
