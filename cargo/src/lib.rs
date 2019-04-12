use std::os::raw::c_char;
use std::ffi::{CString, CStr};

#[no_mangle]
pub extern fn rust_greeting(to: *const c_char) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(to) };
    let recipient = match c_str.to_str() {
        Err(_) => "there",
        Ok(string) => string,
    };

    CString::new("Hello ".to_owned() + recipient).unwrap().into_raw()
}

#[cfg(target_os="android")]
#[allow(non_snake_case)]
pub mod android {
    extern crate jni;

    use jni::JNIEnv;
    use jni::objects::{JClass, JString};
    use jni::sys::{jstring};

    #[no_mangle]
    pub unsafe extern fn Java_com_sakari_flutter_1rust_1app_RustGreetings_greeting(env: JNIEnv, _: JClass, java_pattern: JString) -> jstring {
        let world = super::rust_greeting(env.get_string(java_pattern).expect("invalid pattern string").as_ptr());
        let world_ptr = super::CString::from_raw(world);
        let output = env.new_string(world_ptr.to_str().unwrap()).expect("Couldn't create java string!");

        output.into_inner()
    }
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
