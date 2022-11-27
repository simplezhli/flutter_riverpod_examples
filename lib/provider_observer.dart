import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProviderObserver implements ProviderObserver {
  @override
  void didAddProvider(ProviderBase<dynamic> provider, Object? value, ProviderContainer container) {
    debugPrint('add provider: $provider, value: $value');
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic> provider, ProviderContainer containers) {
    debugPrint('disposed provider: $provider');
  }

  @override
  void didUpdateProvider(ProviderBase<dynamic> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    debugPrint('update provider: $provider, newValue: $newValue');
  }

  @override
  void providerDidFail(ProviderBase<dynamic> provider, Object error, StackTrace stackTrace, ProviderContainer container) {

  }
}
