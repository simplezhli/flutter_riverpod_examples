import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProviderObserver implements ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    print('add provider: $provider, value: $value');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    print('disposed provider: $provider');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('update provider: $provider, newValue: $newValue');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error, StackTrace stackTrace, ProviderContainer container) {

  }
}