// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/src/pages/navegacion.dart';
import 'package:flutter_app_1/src/provider/counter.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_app_1/src/pages/Home.dart';
import 'package:flutter_app_1/src/pages/Login.dart';
import 'package:flutter_app_1/src/pages/Blog.dart';
import 'package:flutter_app_1/src/pages/tabBar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; //el theme del proyecto
// import 'package:flutter_app_1/src/widget/widgets.dart';
import 'package:flutter_app_1/src/pages/Registro.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  //es para llamar el provider y para asi que este globalmente
  runApp(ChangeNotifierProvider(
    create: (_) => CounterProvider(),
    child: const MiApp(),
  ));
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      }),
  GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      }),
  GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      }),
  //para pasarlo un parametro
  GoRoute(
      path: '/blog/:id',
      name: 'blog',
      builder: (context, state) => Blog(id: state.pathParameters['id']))
]);

class MiApp extends StatefulWidget {
  const MiApp({super.key});

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: [
              const navegacion(),
              Expanded(
                child: MaterialApp.router(
                  routerConfig: _router,
                ),
              )
            ],
          ),
        ));
  }
}






  // final List<Widget> _pages = <Widget>[
  //   LoginScreen(),
  //   const Registro(),
  //   const Home(),
  // ];



// body: Scaffold(
//         appBar: AppBar(
//           title: Text('Mi App'),
//         ),
//         body: _pages[0], // Cambia el índice según la página que desees mostrar
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Login'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.business), label: 'Registro'),
//             BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Blog')
//           ],
//         ),
//       ),