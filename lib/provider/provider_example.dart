
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 创建一个全局的provider，里面储存“Hello World!”
final Provider<String> helloWorldProvider = Provider((_) => 'Hello World!');

/// 使用“ConsumerWidget”，在“build”中获取对应的provider
class ProviderExample extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: Center(
        child: Text(value),
      ),
    );
  }
}