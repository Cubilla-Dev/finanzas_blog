import 'package:flutter/material.dart';

class tabBar extends StatelessWidget {
  const tabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tabBar',
      home: HomePages(),
    );
  }
}

class HomePages extends StatelessWidget {
  const HomePages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabs navigacion'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_car),
            ),
          ]),
        ),
        body: const Center(
          child: Text('Hola'),
        ),
      ),
    );
  }
}
