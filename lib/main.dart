import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:objectbox/objectbox.dart';

import 'utils/database/person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  
  runApp(RiverApp(savedThemeMode: savedThemeMode));
}

class RiverApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const RiverApp({
    Key? key,
    this.savedThemeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        colorScheme:
            const ColorScheme.light().copyWith(secondary: Colors.amber),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.amber),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: const Home(),
      ),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('River'),
        actions: [
          IconButton(
              onPressed: () async {
                var currentThem = await AdaptiveTheme.getThemeMode();
                currentThem == AdaptiveThemeMode.light
                    ? AdaptiveTheme.of(context).setDark()
                    : AdaptiveTheme.of(context).setLight();
              },
              icon: LineIcon.sun())
        ],
      ),
    );
  }
}
