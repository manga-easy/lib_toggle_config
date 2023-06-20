## Features

Essa lib é responsavel pelas consultas de toggles de configurações, toggles são
pequenas configurações que vão fazer parte de varias locais do app.

Por exemplo no caso do link do nosso discord, ToggleKey.linkDiscord, ficara
nessa config que pode ser recuperado por todos os micros apps de forma facil
utilizando o package.

## Getting started

Adicione o package como depenencia no pubspec

```
toggle_config:
   git: 
    url: https://github.com/manga-easy/lib_toggle_config.git
    ref: v1.0.0
```

## Usage

```dart
late GetToggleConfigCase casetoggle;
Future<void> main() async {
  // User o <> para por o valor do toggle assim ele realizarar o cast
  final result = await casetoggle<String>(key: ToggleKey.linkDiscord);
  // os toggles só aceita valores primitivos String, int, double e boolean
  print('value: $result');
}
```
