import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/navigation.dart';
import 'package:navi/routes.dart';

class CarScreen extends ConsumerWidget {
  const CarScreen({super.key});

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
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
            onPressed: () => navigator.push(carDetailsPage("asd")),
            child: const Text('Go to car details')),
      ),
    );
  }
}
