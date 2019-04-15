//
// Created by Sheng Tang on 2019/4/12.
//

#ifndef FLUTTER_RUST_APP_GREETINGS_H
#define FLUTTER_RUST_APP_GREETINGS_H

#include <stdint.h>

const char* rust_greeting(const char* to);
void rust_greeting_free(char *);

#endif //FLUTTER_RUST_APP_GREETINGS_H
