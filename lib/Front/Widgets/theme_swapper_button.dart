import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Logic/Theme Provider/theme_changer.dart';

class ThemeSwapButton extends StatelessWidget {
  const ThemeSwapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        context.watch<ThemeChanger>().darkTheme
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
      onPressed: () {

        final themeChanger = context.read<ThemeChanger>();
        themeChanger.darkTheme = !themeChanger.darkTheme;
      },
    );
  }
}
