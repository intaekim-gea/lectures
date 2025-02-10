import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'string_service_plugin_platform_interface.dart';

/// An implementation of [StringServicePluginPlatform] that uses method channels.
class MethodChannelStringServicePlugin extends StringServicePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('string_service_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<List<String>> retrieveAllData() async {
    final strings = await methodChannel.invokeMethod('retrieveAllData');
    return strings.cast<String>();
  }

  @override
  Future<void> addString(String newString) async {
    await methodChannel.invokeMethod(
      'addString',
      {'newString': newString},
    );
  }
}
