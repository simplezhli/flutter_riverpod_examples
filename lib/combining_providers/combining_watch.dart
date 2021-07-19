import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> cityProvider = StateProvider((ref) => 'London');
final StateProvider<String> weatherProvider = StateProvider((ref) {
  final String city = ref.watch(cityProvider).state;
  return '$city (Sunny)';
});

class CombiningProviderExample2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CombiningProvider')),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final String weather = ref.watch(weatherProvider).state;
            return Text('$weather',);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 修改状态
          String city = context.read(cityProvider).state;
          if (city == 'London') {
            context.read(cityProvider).state = "Xi'an";
          } else {
            context.read(cityProvider).state = 'London';
          }
        },
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}