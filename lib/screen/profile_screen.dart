import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared_state/auth0_login_info.dart';
import '../shared_state/login_info.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0LoginInfo = ref.watch(auth0LoginInfoProvider);
    debugPrint(auth0LoginInfo.data.toString());
    final userData = auth0LoginInfo.data!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 4.0),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(userData['picture']),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Text('Name: ${userData['name']}'),
            const SizedBox(width: 48.0, height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    ref.read(loginInfoProvider.notifier).setLoginInfo(false);
                  },
                ),
                ElevatedButton(
                  child: const Text('Logout with Auth0'),
                  onPressed: () {
                    ref.read(auth0LoginInfoProvider.notifier).logout();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
