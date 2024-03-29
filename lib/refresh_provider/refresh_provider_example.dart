
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<List<String>> productsProvider = FutureProvider((_) async {
  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));
  return List.generate(50, (index) => 'Item $index');
});

class RefreshProviderExample extends StatelessWidget {
  const RefreshProviderExample({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final AsyncValue<List<String>> productsProviderValue = ref.watch(productsProvider);
            return productsProviderValue.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => const Text('Oops, something unexpected happened'),
              data: (list) => RefreshIndicator(
                onRefresh: () => ref.refresh(productsProvider.future), /// 刷新
                child: ListView(
                  children: [
                    for (final item in list) ListTile(title: Text(item)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
