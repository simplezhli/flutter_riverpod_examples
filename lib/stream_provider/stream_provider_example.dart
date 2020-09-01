
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StreamProvider<String> streamProvider = StreamProvider((_) async* {
  await Future.delayed(const Duration(seconds: 3));
  yield 'Riverpod';
});

class StreamProviderExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, _) {
            AsyncValue<String> streamProviderValue = watch(streamProvider);
            return streamProviderValue.when(
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Oops, something unexpected happened'),
              data: (value) => Text(
                'Hello $value',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          },
        ),
      ),
    );
  }

}
