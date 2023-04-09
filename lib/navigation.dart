import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navi/routes.dart';

final _naviNavigatorKeyProvider =
    Provider<GlobalKey<NavigatorState>>((_) => GlobalKey<NavigatorState>());

final naviRouterDelegateProvider =
    Provider<NaviRouterDelegate>((ref) => NaviRouterDelegate(ref));

class NaviRouterDelegate extends RouterDelegate<NaviRoute>
    with PopNavigatorRouterDelegateMixin, ChangeNotifier {
  final Ref ref;
  NaviRouterDelegate(this.ref);
  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: ref.watch(naviNavigationStackProvider),
        onPopPage: (route, result) {
          ref.watch(naviNavigationStackProvider.notifier).pop();
          return false;
        },
      );
  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      ref.read(_naviNavigatorKeyProvider);

  @override
  Future<void> setNewRoutePath(configuration) async {}
}

typedef NaviPage = MaterialPage<void>;
typedef NaviPageKey = ValueKey<String>;

final naviNavigationStackProvider =
    NotifierProvider<NaviNavigationStack, List<NaviPage>>(
        () => NaviNavigationStack());

class NaviNavigationStack extends Notifier<List<NaviPage>> {
  List<MaterialPage> homestack = [homePage];
  List<MaterialPage> carstack = [carPage];
  void toggleStack() {
    if (state.contains(homePage)) {
      homestack = state;
      state = carstack;
    } else {
      carstack = state;
      state = homestack;
    }
  }

  void push(NaviPage page) => state = List.from(state..add(page));
  void pop() =>
      state = state.length == 1 ? state : List.from(state..removeLast());

  @override
  List<NaviPage> build() {
    state = [homePage];
    return state;
  }
}

enum NaviRoute {
  home,
  car,
  character,
  carDetails;

  static NaviRoute fromPath(String path) {
    return NaviRoute.values.firstWhere((e) => e.name == path);
  }
}

final naviRouteInformationParser =
    Provider<NaviRouteInformationParser>((_) => NaviRouteInformationParser());

class NaviRouteInformationParser extends RouteInformationParser<NaviRoute> {
  @override
  Future<NaviRoute> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(NaviRoute.fromPath("home"));
}
