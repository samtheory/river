import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river/appwrite/appwrite_client.dart';
import 'package:river/routes/router.gr.dart';
import 'package:river/screens/auth/login_with_email.dart';
import 'package:river/screens/auth/register.dart';
import 'package:river/screens/chat_screen.dart';
import 'package:river/screens/get_started_screen.dart';
import 'package:river/screens/home_bottom_nav_screen.dart';
import 'package:river/screens/image_picker_screen.dart';
import 'package:river/screens/market_screen.dart';
import 'package:river/screens/profile_screen.dart';
import 'package:river/screens/settings_screen.dart';
import 'package:river/screens/wallet_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    // AutoRoute(path: "/", page: GetStartedScreen),
    AutoRoute(path: "/login", page: LoginWithEmailAndPassScreen),
    AutoRoute(path: "/register", page: RegisterScreen),
    AutoRoute(path: "/Pick_image", page: ImagePickerScreen),
    AutoRoute(path: "/", page: HomeBottomNavigationScreen, children: [
      AutoRoute(
        name: 'ChatRouter',
        path: 'chat',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ChatScreen),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        name: 'MarketRouter',
        path: 'market',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: MarketScreen),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        name: 'WalletRouter',
        path: 'wallet',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: WalletScreen),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        name: 'ProfileRouter',
        path: 'profile',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: ProfileScreen),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
    ], guards: [
      AuthGuard
    ]),
    AutoRoute(
      page: SettingsScreen,
      children: [
        // AutoRoute(path: '', page: WalletScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
)
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  bool account;
  AuthGuard(this.account);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
   

    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (account ) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
     
      // we redirect the user to our login page
      router.push(RegisterRoute()).then((value) => resolver.next(true));
    }
  }
}
