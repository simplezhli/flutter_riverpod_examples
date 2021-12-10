
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_examples/state_provider/state_provider_example.dart';


class ProviderListenerExample extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(stateProvider, (previous, next) {
      if (next == 5) {
        print('当前计数器为5，触发监听。');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderListener'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, _) {
                /// 使用Consumer(ConsumerWidget的封装)，控制刷新的范围。
                int count = ref.watch(stateProvider);
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// 使用read获取counterProvider，操作state。
        onPressed: () => ref.read(stateProvider.state).state++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}
