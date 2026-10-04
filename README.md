# Radio Group (deprecated)

> **Deprecated:** Use [radio_group_builder](https://pub.dev/packages/radio_group_builder)
> for new development. It uses Flutter's built-in `RadioGroup` for selection,
> keyboard navigation, and accessibility, and names its widget `RadioGroupBuilder`
> to avoid the name collision with Flutter's `RadioGroup`.

Existing applications can continue using this package. See [MIGRATION.md](MIGRATION.md)
for migration guidance. `radio_group_builder` requires Flutter 3.35+ / Dart 3.9+;
this legacy package requires Flutter 3.22+ / Dart 3.4+ because it uses `WidgetState`.

A widget that groups radio buttons so they can work together to give the user a pleasant experience when making selections within the app.

![A gif demonstrating the radio group in action.](https://raw.githubusercontent.com/babincc/radio_group_v2/master/resources/radio_group_demo.gif)

## Installation for existing applications

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  radio_group_v2: ^3.3.2
```

Import it to each file you use it in:

```dart
import 'package:flutter/material.dart' hide RadioGroup;
import 'package:radio_group_v2/radio_group_v2.dart';
```

Flutter 3.35+ also exports `RadioGroup`. Hide that name from Flutter imports as
shown above, or prefix this package when you need both widgets:

```dart
import 'package:flutter/material.dart';
import 'package:radio_group_v2/radio_group_v2.dart' as legacy;

final controller = legacy.RadioGroupController<String>();
final group = legacy.RadioGroup<String>(
  controller: controller,
  values: ['First', 'Second'],
);
```

The legacy widget emits a deprecation diagnostic but remains available.
Create controllers once (for example, as State fields) and access selection after
the group has mounted.

## Usage

### Example 1

This example is a very basic, vertical radio group.

```dart
RadioGroupController myController = RadioGroupController();

RadioGroup(
  controller: myController,
  values: ["Choice1", "Choice2", "Choice3"],
)
```

### Example 2

This example is a horizontal radio group with some decoration, and it starts with the first button selected.

```dart
RadioGroupController myController = RadioGroupController();

RadioGroup(
  controller: myController,
  values: ["Choice1", "Choice2", "Choice3"],
  indexOfDefault: 0,
  orientation: RadioGroupOrientation.horizontal,
  decoration: RadioGroupDecoration(
    spacing: 10.0,
    labelStyle: TextStyle(
      color: Colors.blue,
    ),
    activeColor: Colors.amber,
  ),
)
```

### Example 3

This example shows how to programmatically select an item using two different methods.

```dart
RadioGroupController myController = RadioGroupController();

List<String> items = ["Choice1", "Choice2", "Choice3"];

RadioGroup(
  controller: myController,
  values: items,
)

// Method 1 - Selects a specific item from the list.
myController.value = items[1]; // Selects Choice2

// Method 2 - Selects whatever item is at the given
//            index in the list.
myController.selectAt(2); // Selects Choice3
```

### Example 4

This example shows how to programmatically select an item using two different silent methods. This means, when the new value in is selected in the list, the `onChanged` method will not be called.

```dart
RadioGroupController myController = RadioGroupController();

List<String> items = ["Choice1", "Choice2", "Choice3"];

RadioGroup(
  controller: myController,
  values: items,
)

// Method 1 - Selects a specific item from the list.
myController.setValueSilently(items[1]); // Selects Choice2

// Method 2 - Selects whatever item is at the given
//            index in the list.
myController.selectSilentlyAt(2); // Selects Choice3
```

### Example 5

This example shows how to retrieve the selected value.

```dart
RadioGroupController myController = RadioGroupController();

RadioGroup(
  controller: myController,
  values: ["Choice1", "Choice2", "Choice3"],
)

String selected = myController.value.toString();
```

---

If you found this helpful, please consider supporting development through
[Buy Me a Coffee](https://www.buymeacoffee.com/babincc),
[PayPal](https://paypal.me/cssbabin), or [Venmo](https://venmo.com/u/babincc).
