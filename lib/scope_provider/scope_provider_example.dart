
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 定义ScopedProvider
final ScopedProvider<int> currentProductIndex = ScopedProvider<int>(null);

class ScopeProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedProvider'),
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

  const ProductItem({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final index = watch(currentProductIndex);
    return ListTile(title: Text('item $index'));
  }
}
