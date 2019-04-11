package com.sakari.flutter_rust_app

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  companion object {
    const val CHANNEL = "com.sakari/greetings"
    init {
      System.loadLibrary("greetings")
    }
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method.equals("greetings")) {
        val msg = RustGreetings().call("Sakari")
        result.success(msg)
      } else {
        result.notImplemented()
      }
    }
  }
}
