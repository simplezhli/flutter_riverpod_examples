
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_examples/state_provider/state_provider_example.dart';


class ProviderListenerExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
            ProviderListener<StateController<int>>(
              provider: stateProvider,
              onChange: (_, counter) {
                if (counter.state == 5) {
                  print('当前计数器为5，触发监听。');
                }
              },
              child: Consumer(
                builder: (context, watch, _) {
                  /// 使用Consumer(ConsumerWidget的封装)，控制刷新的范围。
                  int count = watch(stateProvider).state;
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// 使用read获取counterProvider，操作state。
        onPressed: () => context.read(stateProvider).state++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}
