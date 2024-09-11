import 'package:flutter/material.dart';
import 'package:kas_personsl/providers/kas_provider.dart';
import 'package:kas_personsl/router.dart';
import 'package:kas_personsl/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context) => KasProvider(),
        ),
    ],
    child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: router,
    );
  }
}

