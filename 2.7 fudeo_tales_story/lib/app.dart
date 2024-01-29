import 'package:flutter/material.dart';
import 'package:fudeo_tales/di/dependency_injector.dart';
import 'package:fudeo_tales/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fudeo Tales',
          theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              toolbarHeight: 96.0,
              centerTitle: true,
              color: Colors.transparent,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                letterSpacing: 4.0,
                fontWeight: FontWeight.w800,
              ),
              iconTheme: IconThemeData(
                size: 24.0,
                color: Colors.black,
              ),
            ),
          ),
          home: const HomePage(),
        ),
      );
}
