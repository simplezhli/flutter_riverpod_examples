
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FutureProvider<List<String>> productsProvider = FutureProvider((_) async {
  /// 延时3s
  await Future.delayed(const Duration(seconds: 3));
  return List.generate(50, (index) => 'Item $index');
});

class RefreshProviderExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RefreshProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, _) {
            AsyncValue<List<String>> productsProviderValue = watch(productsProvider);
            return productsProviderValue.when(
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Oops, something unexpected happened'),
              data: (list) => RefreshIndicator(
                onRefresh: () => context.refresh(productsProvider), /// 刷新
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
