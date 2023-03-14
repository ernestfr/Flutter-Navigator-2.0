import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/routes.dart';

class NavigatorProvider extends ChangeNotifier {
  List<MaterialPage> backstack = [homePage]; // current stack

  List<MaterialPage> homestack = [homePage]; 
  List<MaterialPage> carstack = [carPage]; 

  bool pop() {
    if (backstack != [homePage]) {
      // var tempStack = backstack.removeLast();
      _setStack([...backstack..removeLast()]);
    }
    return backstack.length == 1;
  }

  void _setStack(List<MaterialPage> stack) {
    if (stack != backstack) {
      backstack = stack;
      notifyListeners();
    }
  }

  void goToPage(MaterialPage page) {
    if (!backstack.contains(page)) {
      _setStack([...backstack, page]);
    }
  }


  void goToCharacter() {
    if (!backstack.contains(characterPage)) {
      _setStack([...backstack, characterPage]);
    }
  }

  void goToCarDetails(String model) {
    if (!backstack.contains(carDetailsPage(model))) {
      _setStack([...backstack, carDetailsPage(model)]);
    }
  }

  void toggleStack() { 
    if (backstack.contains(homePage)) {
      homestack = backstack;
      backstack = carstack;
    } else {
      carstack = backstack;
      backstack = homestack;
    }
    notifyListeners();
  }
}

final navigatorProvider = ChangeNotifierProvider<NavigatorProvider>((ref) {
  return NavigatorProvider();
});
