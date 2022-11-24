
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<Person> personProvider = ChangeNotifierProvider((_) => Person());

class Person extends ChangeNotifier {
  int _age = 0;
  int get age => _age;
  set age(int age) {
    _age = age;
    notifyListeners();
  }

  String _name = 'weilu';
  String get name => _name;
  set name(String name) {
    _name = name;
    notifyListeners();
  }
}

class SelectExample extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (_, ref, __) {
                String name = ref.watch(personProvider.select((p) => p.name));
                return Text(
                  'name:$name',
                );
              },
            ),
            Consumer(
              builder: (_, ref, __) {
                int age = ref.watch(personProvider.select((p) => p.age));
                return Text(
                  'age:$age',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 这里age变化时，只有对应的Text会变化。
        onPressed: () => ref.read(personProvider).age = Random.secure().nextInt(100),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }

}
