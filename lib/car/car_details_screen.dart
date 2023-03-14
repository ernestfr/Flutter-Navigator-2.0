import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/navigator_provider.dart';

class CarDetailsScreen extends ConsumerWidget {
  const CarDetailsScreen(this.model, {super.key});

  final String model;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Details"),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: ref.watch(navigatorProvider).toggleStack,
          child: const Text("Change Stack"),
        ),
      ),
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("FaVe", style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),),
            ElevatedButton(
                onPressed: () =>
                    ref.watch(navigatorProvider).goToCarDetails("FaVe"),
                child: const Text('Go to car details')),
          ],
        ),
      ),
    );
  }
}
