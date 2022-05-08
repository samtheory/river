import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river/routes/router.dart';
import 'package:river/routes/router.gr.dart';

const Color cWhite = Color(0xFFFAFEFE);
const Color cDark = Color(0xff2B2B2C);

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
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: AppBarTheme(
            actionsIconTheme: const IconThemeData(color: cDark),
            elevation: .2,
            titleTextStyle: GoogleFonts.mogra(
              color: cDark,
              fontSize: 26,
            ),
            backgroundColor: cWhite,
          ),
          scaffoldBackgroundColor: cWhite,
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
        builder: (theme, darkTheme) => MaterialApp.router(
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
