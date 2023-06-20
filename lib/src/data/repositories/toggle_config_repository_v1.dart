import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:toggle_config/src/domain/repositories/toggle_config_repository.dart';

class ToggleConfigRepositoryV1 extends ToggleConfigRepository {
  ToggleConfigRepositoryV1(super.dataSource);

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
