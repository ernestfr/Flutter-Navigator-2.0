import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/navigator_provider.dart';
import 'package:navi/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: ref.watch(navigatorProvider).toggleStack,
          child: const Text("Change Stack"),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
            onPressed: () =>
                ref.watch(navigatorProvider).goToPage(characterPage),
            child: const Text('Go to character')),
      ),
    );
  }
}
