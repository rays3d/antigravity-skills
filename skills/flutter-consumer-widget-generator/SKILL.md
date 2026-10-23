---
name: flutter-consumer-widget-generator
description: "Scaffold Flutter UI widgets enforcing Riverpod 3.0 rules, ConsumerWidget patterns, and clean widget extraction."
---

# Flutter Consumer Widget Generator

## Rules

1. Use `ConsumerWidget` or `ConsumerStatefulWidget` whenever the widget reads or watches Riverpod providers.
2. Use:
   - `ref.watch()` for reactive UI.
   - `ref.read()` for event handlers and commands.
3. Keep business logic inside providers/notifiers, not widgets.
4. Prefer extracting reusable UI into dedicated widget classes instead of large helper methods.
5. Follow the project's conventions for imports, routing, theming, and centralized resources.
6. **Consult `flutter-project-conventions`** for overarching UI and architecture rules.

## Prompt

> Generate a Riverpod-based widget following the project's UI architecture and composition conventions.


## Modern Pattern Matching (Freezed 3/4)
Consume union state exhaustively using native Dart 3 switch expressions instead of legacy `.when()`:

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final state = ref.watch(userListNotifierProvider);

  return switch (state) {
    _Initial() => const SizedBox.shrink(),
    _Loading() => const Center(child: CircularProgressIndicator()),
    _Loaded(:final users) => UserListView(users: users),
    _Error(:final message) => ErrorBanner(message: message),
  };
}
```
