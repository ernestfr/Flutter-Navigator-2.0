import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/navigation.dart';
import 'package:navi/routes.dart';

class CharacterScreen extends ConsumerWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final navigator = ref.watch(naviNavigationStackProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character"),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: navigator.toggleStack,
          child: const Text("Change Stack"),
        ),
      ),
      backgroundColor: Colors.blue[900],
      body: Center(
        child: ElevatedButton(
            onPressed: () => navigator.push(characterPage),
            child: const Text('Go to character')),
      ),
    );
  }
}
