import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/cart/page/cart_view.dart' deferred as cart;
import '../modules/category/page/category_view.dart' deferred as category;
import '../modules/favorites/page/favorites_view.dart' deferred as favorites;
import '../modules/home/page/home_view.dart' deferred as home;
import '../modules/profile/page/profile_view.dart' deferred as profile;
import '../modules/splash/page/splash_page.dart' deferred as splash;
import 'app_route_names.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.initialRoot,
    routes: [
      GoRoute(
        path: AppRouteNames.initialRoot,
        name: AppRouteNames.initialRoot,
        builder: (context, state) => splash.SplashPage(),
        redirect: (BuildContext context, GoRouterState state) async {
          await splash.loadLibrary();
          return null;
        },
      ),
      GoRoute(
        path: AppRouteNames.home,
        name: AppRouteNames.home,
        builder: (context, state) => home.HomeView(),
        redirect: (BuildContext context, GoRouterState state) async {
          await home.loadLibrary();
          return null;
        },
      ),
      GoRoute(
        path: AppRouteNames.profile,
        name: AppRouteNames.profile,
        builder: (context, state) => profile.ProfileView(),
        redirect: (BuildContext context, GoRouterState state) async {
          await profile.loadLibrary();
          return null;
        },
      ),
      GoRoute(
        path: AppRouteNames.category,
        name: AppRouteNames.category,
        builder: (context, state) => category.CategoryView(),
        redirect: (BuildContext context, GoRouterState state) async {
          await category.loadLibrary();
          return null;
        },
      ),
      GoRoute(
        path: AppRouteNames.cart,
        name: AppRouteNames.cart,
        builder: (context, state) => cart.CartView(),
        redirect: (BuildContext context, GoRouterState state) async {
          await cart.loadLibrary();
          return null;
        },
      ),
      GoRoute(
        path: AppRouteNames.favorites,
        name: AppRouteNames.favorites,
        builder: (context, state) => favorites.FavoritesView(),
        redirect: (BuildContext context, GoRouterState state) async {
          await favorites.loadLibrary();
          return null;
        },
      ),
    ],
  );
}
