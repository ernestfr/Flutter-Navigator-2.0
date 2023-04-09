import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/routes.dart';
import 'package:navi/navigation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final navigator = ref.watch(naviNavigationStackProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: navigator.toggleStack,
          child: const Text("Change Stack"),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
            onPressed: () =>
               navigator.push(characterPage),
            child: const Text('Go to character')),
      ),
    );
  }
}
