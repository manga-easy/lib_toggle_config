import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:toggle_config/src/data/datasources/datasource_toggle_config.dart';

abstract class ToggleConfigRepository {
  final DataSourceToggleConfig dataSource;

  ToggleConfigRepository(this.dataSource);

  Future<ToggleConfigEntity> getToggle(ToggleKey key);
}
