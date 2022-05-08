import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icon.dart';
import 'package:river/routes/router.gr.dart';

class HomeBottomNavigationScreen extends HookWidget {
  const HomeBottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navCurrentIndex = useState(0);
    return AutoTabsScaffold(
      routes: const [
        ProfileRouter(),
        ChatRouter(),
        WalletRouter(),
        MarketRouter(),
      ],

      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            onTap: (int index) {
              tabsRouter.setActiveIndex(index);
              _navCurrentIndex.value = index;
            },
            currentIndex: _navCurrentIndex.value,
            selectedItemColor: Colors.blue[700],
            unselectedItemColor: Colors.grey[400],
            items: [
              BottomNavigationBarItem(
                icon: LineIcon.user(),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: LineIcon.wallet(),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: LineIcon.rocketChat(),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: LineIcon.store(),
                label: 'Market',
              ),
            ]);
      },
      appBarBuilder: (_, tabsRouter) {
        return AppBar(
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
        );
      },
    );
  }
}
