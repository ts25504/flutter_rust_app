package com.sakari.flutter_rust_app

class RustGreetings {
    private external fun greeting(pattern: String): String

    fun call(to: String): String {
        return greeting(to)
    }
}
