import 'package:client_driver/client_driver.dart';
import 'package:get_it/get_it.dart';
import 'package:toggle_config/src/data/datasources/datasource_toggle_config.dart';

class DataSourceToggleConfigV1 implements DataSourceToggleConfig {
  final String version = 'v1';
  final ClientRequest _driverHttp = GetIt.I();
  final String host = 'https://micro-config.lucas-cm.com.br';
  final timeout = const Duration(seconds: 3);

  DataSourceToggleConfigV1();

  @override
  Future<Map<String, dynamic>> getToggle(String name) async {
    var ret = await _driverHttp.get(
      path: '$host/$version/toggle/search?name=$name',
      receiveTimeout: timeout,
      sendTimeout: timeout,
    );
    final List data = ret.data['data'];

    return Map<String, dynamic>.from(data.first);
  }
}
