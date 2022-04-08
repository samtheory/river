import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:river/routes/router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: HomePage, children: [
      AutoRoute(
        path: "books",
        name: "BooksRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: BookPage),
          AutoRoute(path: 'bookchild', page: BookChildPage),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: "setting",
        name: "SettingRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: SettingPage),
          AutoRoute(path: 'details', page: HorsePage),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: "profile",
        name: "ProfileRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ProfilePage),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
    ]),
  ],
)
class $AppRouter {}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        BooksRouter(),
        SettingRouter(),
        ProfileRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            currentIndex: 1,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.pink[200],
            items: [
              BottomNavigationBarItem(icon: LineIcon.book(), label: 'book'),
              // BottomNavigationBarItem(icon: LineIcon.horse(), label: 'horse'),
              BottomNavigationBarItem(icon: LineIcon.user(), label: 'user'),
              BottomNavigationBarItem(icon: LineIcon.cogs(), label: 'settings')
            ]);
      },
      backgroundColor: Colors.blue,
      appBarBuilder: (_ ,tabsRouter){
return  AppBar(
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

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: ElevatedButton(
        onPressed: () {
          context.router.push(BookChildRoute());
        },
        child: Center(child: Text('Book')),
      ),
    );
  }
}

class BookChildPage extends StatelessWidget {
  const BookChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text('Book sub page'),
      ),
    );
  }
}

class HorsePage extends StatelessWidget {
  const HorsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text('Hourse'),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text('Setting'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
