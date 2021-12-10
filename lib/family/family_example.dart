
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 使用family，可以在获取provider时传入city
final _weatherProvider = Provider.family<String, String>((ref, city) {
  return '$city (Sunny)';
});

class FamilyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Family')),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            /// 这里可以传参“London”
            final String weather = ref.watch(_weatherProvider('London'));
            return Text('$weather',);
          },
        ),
      ),
    );
  }
}
