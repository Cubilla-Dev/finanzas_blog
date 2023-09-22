import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_app_1/src/pages/Home.dart';
import 'package:flutter_app_1/src/pages/Login.dart';
import 'package:flutter_app_1/src/pages/Blog.dart';
//el theme del proyecto
import 'package:flutter_app_1/src/widget/widgets.dart';

void main() => runApp(const MiApp());

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      }),
  GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      }),
  GoRoute(
      path: '/blog/:id',
      name: 'blog',
      builder: (context, state) => Blog(id: state.pathParameters['id']))
]);

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
    // home: cuerpo(context),
  }
}
// (
//       title: 'Flutter Demo',
//       theme: AppTheme.theme,
//       initialRoute: '/home',
//       routes: {
//         '/blog': (context) => const Blog(),
//         '/': (context) => LoginScreen(),
//         '/home': (context) => const Home(),
//       },