#!/bin/bash

# Download Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

flutter doctor
flutter config --enable-web
flutter pub get
