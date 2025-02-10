package com.example.strings

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.strings"
    private val data = mutableListOf<String>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "retrieveAllData" -> result.success(data)
                "addString" -> {
                val newString = call.argument<String>("newString")
                if (newString != null) {
                    data.add(newString)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "String is null", null)
                }
            }
            else -> result.notImplemented()
      }
    }
  }    
}
