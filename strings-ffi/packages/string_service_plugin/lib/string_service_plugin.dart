import 'string_service_plugin_platform_interface.dart';

class StringServicePlugin {
  Future<String?> getPlatformVersion() {
    return StringServicePluginPlatform.instance.getPlatformVersion();
  }

  Future<List<String>> retrieveAllData() async {
    return StringServicePluginPlatform.instance.retrieveAllData();
  }

  Future<void> addString(String newString) async {
    return StringServicePluginPlatform.instance.addString(newString);
  }
}
