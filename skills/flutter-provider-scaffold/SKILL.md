---
name: flutter-provider-scaffold
description: "Generate Riverpod 3.0 Notifiers and Freezed-backed state classes following presentation-layer conventions."
---

# Flutter Provider Scaffold

## Rules

1. Generate:
   - `<feature>_state.dart`
   - `<feature>_provider.dart`
2. Use:
   - `@freezed` with `sealed class` for union state classes (Freezed 3/4+ standard).
   - Dart 3 native `switch` expressions for exhaustive pattern matching (replacing legacy `.when()`).
   - `@riverpod` with a generated Notifier.
3. Include standard state variants appropriate for the feature (e.g. `initial`, `loading`, `loaded`, `error`).
4. Keep business logic inside the provider and inject dependencies through Riverpod.
5. Generate the required `part` directives for Freezed and Riverpod.
6. If code generation is required, recommend the appropriate `build_runner` command.
7. **Consult `flutter-project-conventions`** for overarching architectural rules.

## Prompt

> Scaffold the Riverpod provider and Freezed state for the `<feature>` feature following the project's conventions.

## Reference Templates

### State Class (`<feature>_state.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

// Replace with actual models
// import 'package:{{package_name}}/features/{{feature}}/imports.dart';

part '{{feature}}_state.freezed.dart';

@freezed
sealed class {{FeatureName}}State with _${{FeatureName}}State {
  const factory {{FeatureName}}State.initial() = _Initial;
  const factory {{FeatureName}}State.loading() = _Loading;
  const factory {{FeatureName}}State.loaded(
      // List<{{ModelName}}> items,
  ) = _Loaded;
  const factory {{FeatureName}}State.error(String message) = _Error;
}
```

### Provider Class (`<feature>_provider.dart`)

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '{{feature}}_state.dart';

// Inject necessary repositories/services
// import 'package:{{package_name}}/features/{{feature}}/imports.dart';

part '{{feature}}_provider.g.dart';

@riverpod
class {{FeatureName}}Notifier extends _${{FeatureName}}Notifier {
  @override
  {{FeatureName}}State build() {
    return const {{FeatureName}}State.initial();
  }

  Future<void> loadData() async {
    state = const {{FeatureName}}State.loading();
    try {
      // final repo = ref.read({{feature}}RepositoryProvider);
      // final data = await repo.fetchSomething();

      // state = {{FeatureName}}State.loaded(data);
    } catch (e) {
      state = {{FeatureName}}State.error(e.toString());
    }
  }
}
```
