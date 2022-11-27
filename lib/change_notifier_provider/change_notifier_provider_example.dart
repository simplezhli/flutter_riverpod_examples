
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<Counter> changeNotifierProvider = ChangeNotifierProvider<Counter>((_) => Counter());

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
  void decrement(){
    _count--;
    notifyListeners();
  }

  @override
  String toString() {
    return 'count：$count';
  }
}

class ChangeProviderNotifierExample extends ConsumerWidget {
  const ChangeProviderNotifierExample({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, _) {
                final int count = ref.watch(changeNotifierProvider).count;
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
        /// 使用read获取counterProvider。
        onPressed: () => ref.read(changeNotifierProvider).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

}
