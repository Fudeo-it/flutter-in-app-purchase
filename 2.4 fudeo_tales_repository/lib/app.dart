import 'package:flutter/material.dart';
import 'package:fudeo_tales/di/dependency_injector.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
    child: MaterialApp(
      title: 'Fudeo Tales',
      theme: ThemeData(
        useMaterial3: false,
      ),
    ),
  );
}