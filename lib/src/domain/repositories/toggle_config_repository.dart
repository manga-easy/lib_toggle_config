import 'package:manga_easy_sdk/manga_easy_sdk.dart';

abstract class ToggleConfigRepository {
  Future<ToggleConfigEntity> getToggle(ToggleKey key);
}
