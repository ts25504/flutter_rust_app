#!/bin/bash

# 64 bit targets (real device & simulator):
rustup target add aarch64-apple-ios x86_64-apple-ios

# 32 bit targets (you probably don't need these):
rustup target add armv7-apple-ios i386-apple-ios

cargo lipo --release
ln -snf $PWD/target/universal/release/libmiddleware.a ../ios/Flutter/libmiddleware.a
