// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package

import 'package:flutter/material.dart' hide RadioGroup;
import 'package:flutter_test/flutter_test.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

void main() {
  testWidgets(
      'controller works after first mount and silent updates stay silent',
      (tester) async {
    final controller = RadioGroupController<String>();
    final changes = <String?>[];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RadioGroup<String>(
          controller: controller,
          values: const ['First', 'Second'],
          onChanged: changes.add,
        ),
      ),
    ));
    controller.value = 'First';
    await tester.pump();
    expect(controller.value, 'First');
    expect(controller.selectedIndex, 0);
    expect(changes, ['First']);
    controller.selectSilentlyAt(1);
    await tester.pump();
    expect(controller.value, 'Second');
    expect(changes, ['First']);
  });

  testWidgets('legacy labels notify once and toggle off with null',
      (tester) async {
    final changes = <String?>[];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RadioGroup<String>(
          controller: RadioGroupController<String>(),
          values: const ['First', 'Second'],
          decoration: const RadioGroupDecoration(toggleable: true),
          onChanged: changes.add,
        ),
      ),
    ));

    await tester.tap(find.text('First'));
    await tester.pump();
    expect(changes, ['First']);
    await tester.tap(find.text('First'));
    await tester.pump();
    expect(changes, ['First', null]);
    await tester.tap(find.byType(Radio<String>).last);
    await tester.pump();
    expect(changes, ['First', null, 'Second']);
  });
}
