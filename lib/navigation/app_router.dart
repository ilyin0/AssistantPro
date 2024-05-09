import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../ui/ui.dart';
import 'app_routes.dart';

abstract final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => ChatsScreen(),
        routes: [
          GoRoute(
            name: AppRoutes.chat,
            path: '${AppRoutes.chat}/:${AppRoutes.chatParameters.chatId}',
            builder: (_, state) {
              final chatId = int.parse(
                state.pathParameters[AppRoutes.chatParameters.chatId]!,
              );
              return ChatScreen(chatId: chatId);
            },
          ),
        ],
      ),
    ],
  );
}
