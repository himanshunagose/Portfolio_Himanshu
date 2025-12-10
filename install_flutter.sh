#!/bin/bash

# If Flutter already exists, skip cloning
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable
fi

export PATH="$PATH:`pwd`/flutter/bin"

flutter doctor
flutter config --enable-web
flutter pub get
