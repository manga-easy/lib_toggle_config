import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:toggle_config/toggle_config.dart';

late GetToggleConfigCase casetoggle;
Future<void> main() async {
  final result = await casetoggle<String>(key: ToggleKey.linkDiscord);
  print('value: $result');
}
