
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<Counter> _counterProvider = ChangeNotifierProvider((_) => Counter());

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

class ChangeProviderNotifierExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, watch, _) {
                int count = watch(_counterProvider).count;
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
        onPressed: () => context.read(_counterProvider).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}
