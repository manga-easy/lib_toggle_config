import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:persistent_database/persistent_database.dart';
import 'package:toggle_config/src/data/repositories/toggle_config_repository_v1.dart';
import 'package:toggle_config/src/domain/entities/toggle_config_cache_entity.dart';
import 'package:toggle_config/src/domain/repositories/toggle_config_repository.dart';

class GetToggleConfigCase {
  final ToggleConfigRepository _toggleConfigRepository =
      ToggleConfigRepositoryV1();
  final PersistentDatabaseSembast _sembastService;
  final int _timeCache = 5; //Tempo de de cache em minutos
  final StoreSembast _store = StoreSembast.toggleConfig;

  GetToggleConfigCase(this._sembastService);

  Future<T> call<T>({required ToggleKey key}) async {
    try {
      final valueCache = await _verifyCache(key);
      if (valueCache != null) {
        return valueCache as T;
      }
      var result = await _toggleConfigRepository.getToggle(key);
      final toggleCache = ToggleConfigCacheEntity(
        value: result.value,
        updateAt: DateTime.now().millisecondsSinceEpoch,
      );
      _sembastService.update(
        id: key.name,
        objeto: toggleCache.toMap(),
        store: _store,
      );

      return result.value;
    } catch (e) {
      Helps.log(e);
      final valueCache = await _verifyCache(key);
      if (valueCache != null) {
        return valueCache as T;
      }
      return key.defaultValue;
    }
  }

  Future _verifyCache(ToggleKey key) async {
    final result = await _sembastService.get(
      id: key.name,
      store: _store,
    );
    if (result == null) {
      return null;
    }
    final toggle = ToggleConfigCacheEntity.fromMap(result);
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(toggle.updateAt),
    );
    if (diff.inMinutes < _timeCache) {
      return toggle.value;
    }
    return null;
  }
}
