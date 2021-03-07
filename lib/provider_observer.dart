import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProviderObserver implements ProviderObserver {

  @override
  void didAddProvider(ProviderBase<dynamic, dynamic> provider, Object? value) {
    print('add provider: $provider, value: $value');
  }

  @override
  void mayHaveChanged(ProviderBase<dynamic, dynamic> provider) {
//    print('mayHaveChanged provider: $provider');
  }

  @override
  void didUpdateProvider(ProviderBase<dynamic, dynamic> provider, Object? newValue) {
    print('update provider: $provider, newValue: $newValue');
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic, dynamic> provider) {
    print('disposed provider: $provider');
  }
}