import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router.dart';

import 'shared_state/auth0_login_info.dart';

Future main() async {
  await dotenv.load(fileName: ".env.development");
  runApp(const ProviderScope(child: MyAwesomeApp()));
}

class MyAwesomeApp extends HookConsumerWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        ref.watch(auth0LoginInfoProvider.notifier).initAction();
      });
      return;
    }, const []);

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Ryougoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
