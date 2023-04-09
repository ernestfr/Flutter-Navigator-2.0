import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/navigation.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: 'Material App',
        home: Scaffold(
          body: Router(
            routerDelegate: ref.watch(naviRouterDelegateProvider),
            routeInformationParser: ref.watch(naviRouteInformationParser),
          ),
        ));
  }
}
