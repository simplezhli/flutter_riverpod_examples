import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> cityProvider = StateProvider<String>((ref) => 'London');
final StateProvider<String> weatherProvider = StateProvider<String>((ref) {
  final String city = ref.watch(cityProvider);
  return '$city (Sunny)';
});

class CombiningProviderExample2 extends ConsumerWidget {
  const CombiningProviderExample2({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('CombiningProvider')),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final String weather = ref.watch(weatherProvider);
            return Text(weather,);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 修改状态
          final String city = ref.read(cityProvider.notifier).state;
          if (city == 'London') {
            ref.read(cityProvider.notifier).state = "Xi'an";
          } else {
            ref.read(cityProvider.notifier).state = 'London';
          }
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
