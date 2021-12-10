import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> cityProvider = StateProvider<String>((ref) => 'London');
final StateProvider<String> weatherProvider = StateProvider<String>((ref) {
  final String city = ref.watch(cityProvider);
  return '$city (Sunny)';
});

class CombiningProviderExample2 extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('CombiningProvider')),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final String weather = ref.watch(weatherProvider);
            return Text('$weather',);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 修改状态
          String city = ref.read(cityProvider.state).state;
          if (city == 'London') {
            ref.read(cityProvider.state).state = "Xi'an";
          } else {
            ref.read(cityProvider.state).state = 'London';
          }
        },
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}