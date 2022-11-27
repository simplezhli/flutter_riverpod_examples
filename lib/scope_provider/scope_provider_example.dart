
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<int> currentProductIndex = Provider<int>((_) => 0);

class ScopeProviderExample extends StatelessWidget {
  const ScopeProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScopedProvider'),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ProviderScope(
            overrides: [
              /// 修改value
              currentProductIndex.overrideWithValue(index),
            ],
            /// 使用'const'关键字实例化了“ProductItem”，但仍然可以在内部动态获取内容。
            child: const ProductItem(),
          );
        },
      ),
    );
  }
}

class ProductItem extends ConsumerWidget {

  const ProductItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentProductIndex);
    return ListTile(title: Text('item $index'));
  }
}
