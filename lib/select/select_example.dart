
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class SelectExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HookBuilder(
              builder: (_) {
                String name = useProvider(personProvider.select((p) => p.name));
                /// 如果使用下面的方式，则age变化时，这里的Text也会刷新。
//                String name = useProvider(personProvider).name;
                return Text(
                  'name:$name',
                );
              },
            ),
            HookBuilder(
              builder: (_) {
                int age = useProvider(personProvider.select((p) => p.age));
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
        onPressed: () => context.read(personProvider).age = Random.secure().nextInt(100),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }

}
