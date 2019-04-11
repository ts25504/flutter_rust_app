package com.sakari.flutter_rust_app

/**
 * Created by TangSheng (tangsheng02@meituan.com) on 2019/4/9.
 */

class RustGreetings {
    private external fun greeting(pattern: String): String

    fun call(to: String): String {
        return greeting(to)
    }
}
