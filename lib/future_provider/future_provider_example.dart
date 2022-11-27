
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<String> futureProvider = FutureProvider<String>((_) async {
  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));
  return 'Riverpod';
});

class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
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
