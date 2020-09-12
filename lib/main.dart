import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_examples/provider_observer.dart';
import 'package:flutter_riverpod_examples/scope_provider/scope_provider_example.dart';
import 'auto_dispose/auto_dispose_example.dart';
import 'auto_dispose/auto_dispose_future_example.dart';
import 'change_notifier_provider/change_notifier_provider_example.dart';
import 'combining_providers/combining_read.dart';
import 'combining_providers/combining_watch.dart';
import 'family/family_example.dart';
import 'future_provider/future_provider_example.dart';
import 'provider/provider_example.dart';
import 'provider_listener/provider_listener_example.dart';
import 'refresh_provider/refresh_provider_example.dart';
import 'select/select_example.dart';
import 'state_notifier_provider/state_notifier_provider_example.dart';
import 'state_provider/state_provider_example.dart';
import 'stream_provider/stream_provider_example.dart';

void main() {
  runApp(
    // 添加“ProviderScope”。所有使用Riverpod的Flutter程序都必须
    // 在widget tree的根部添加它，用来储存各个provider。
    ProviderScope(
      child: MyApp(),
      observers: [
        MyProviderObserver(),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Example'),
      ),
      body: ListView(
        children: [
          _ListTile(title: 'Provider', page: ProviderExample()),
          _ListTile(title: 'StateProvider', page: StateProviderExample()),
          _ListTile(title: 'StateNotifierProvider', page: StateProviderNotifierExample()),
          _ListTile(title: 'ChangeNotifierProvider', page: ChangeProviderNotifierExample()),
          _ListTile(title: 'FutureProvider', page: FutureProviderExample()),
          _ListTile(title: 'StreamProvider', page: StreamProviderExample()),
          _ListTile(title: 'ProviderListener', page: ProviderListenerExample()),
          _ListTile(title: 'CombiningProvider1', page: CombiningProviderExample1()),
          _ListTile(title: 'CombiningProvider2', page: CombiningProviderExample2()),
          _ListTile(title: 'Family', page: FamilyExample()),
          _ListTile(title: 'AutoDispose1', page: AutoDisposeExample1()),
          _ListTile(title: 'AutoDispose2', page: AutoDisposeExample2()),
          _ListTile(title: 'RefreshProvider', page: RefreshProviderExample()),
          _ListTile(title: 'Select', page: SelectExample()),
          _ListTile(title: 'ScopeProvider', page: ScopeProviderExample()),
        ],
      ),
    );
  }
}


class _ListTile extends StatelessWidget {

  const _ListTile({
    Key key,
    @required this.title,
    @required this.page}
   ): super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => page),
        );
      }
    );
  }
}

