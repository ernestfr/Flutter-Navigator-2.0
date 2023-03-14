import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/navigator_provider.dart';

class CarScreen extends ConsumerWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character"),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: ref.watch(navigatorProvider).toggleStack,
          child: const Text("Change Stack"),
        ),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
            onPressed: ()=>ref.watch(navigatorProvider).goToCarDetails("FaVe"),
            child: const Text('Go to car details')),
      ),
    );
  }
}
