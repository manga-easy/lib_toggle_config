import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:toggle_config/src/data/datasources/datasource_toggle_config.dart';
import 'package:toggle_config/src/data/datasources/datasource_toggle_config_v1.dart';
import 'package:toggle_config/src/domain/repositories/toggle_config_repository.dart';

class ToggleConfigRepositoryV1 implements ToggleConfigRepository {
  final DataSourceToggleConfig dataSource = DataSourceToggleConfigV1();
  ToggleConfigRepositoryV1();

  @override
  Future<ToggleConfigEntity> getToggle(ToggleKey key) async {
    var ret = await dataSource.getToggle(key.name);

    return ToggleConfigEntity(
      description: ret['description'],
      id: ret['id'],
      name: ret['name'],
      status: ret['name'],
      updateAt: ret['updateAt'],
      value: ret['value'],
    );
  }
}
