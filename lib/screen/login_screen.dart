import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared_state/login_info.dart';
import '../shared_state/auth0_login_info.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0LoginInfo = ref.watch(auth0LoginInfoProvider);

    return Scaffold(
      body: Center(
        child: auth0LoginInfo.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      ref.read(loginInfoProvider.notifier).setLoginInfo(true);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Login with Auth0'),
                    onPressed: () {
                      ref.read(auth0LoginInfoProvider.notifier).login();
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
