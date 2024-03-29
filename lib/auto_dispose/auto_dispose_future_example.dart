
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider.autoDispose<String>((ref) async {

  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));
  /// 调用ref.keepAlive();，则将保留状态，下次重新进入页面时不会触发延时。
  return 'Riverpod';
});

class AutoDisposeExample2 extends StatelessWidget {
  const AutoDisposeExample2({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDispose'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final AsyncValue<String> futureProviderValue = ref.watch(futureProvider);
            return futureProviderValue.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => const Text('Oops, something unexpected happened'),
              data: (value) => Text(
                'Hello $value',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          },
        ),
      ),
    );
  }

}
