import 'package:flutter/services.dart';

class StringService {
  static const MethodChannel _channel = MethodChannel('com.example.strings');

  Future<List<String>> retrieveAllData() async {
    final List<dynamic> result = await _channel.invokeMethod('retrieveAllData');
    return result.cast<String>();
  }

  Future<void> addString(String newString) async {
    await _channel.invokeMethod('addString', {'newString': newString});
  }
}
