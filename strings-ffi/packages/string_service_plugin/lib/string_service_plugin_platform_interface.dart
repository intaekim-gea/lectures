import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'string_service_plugin_method_channel.dart';

abstract class StringServicePluginPlatform extends PlatformInterface {
  /// Constructs a StringServicePluginPlatform.
  StringServicePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static StringServicePluginPlatform _instance =
      MethodChannelStringServicePlugin();

  /// The default instance of [StringServicePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelStringServicePlugin].
  static StringServicePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StringServicePluginPlatform] when
  /// they register themselves.
  static set instance(StringServicePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<String>> retrieveAllData() async {
    throw UnimplementedError('retrieveAllData() has not been implemented.');
  }

  Future<void> addString(String newString) async {
    throw UnimplementedError('addString() has not been implemented.');
  }
}
