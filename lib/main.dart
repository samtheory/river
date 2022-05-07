import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icon.dart';

import 'package:river/appwrite/appwrite_client.dart';
import 'package:river/routes/router.dart';
import 'package:river/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(RiverApp(savedThemeMode: savedThemeMode));
}

/// My [MaterialApp] + [AdaptiveThem]
class RiverApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  RiverApp({Key? key, this.savedThemeMode}) : super(key: key);
   final _appRouter = AppRouter(authGuard: AuthGuard(true));
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          colorScheme:
              const ColorScheme.light().copyWith(secondary: Colors.amber),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          colorScheme:
              const ColorScheme.dark().copyWith(secondary: Colors.amber),
        ),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) =>  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Adaptive Theme Demo',
      theme: theme,
      darkTheme: darkTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    ),
      ),
    );
  }
}
