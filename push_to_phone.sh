#!/bin/bash

# Check if device is connected
if ! adb devices | grep -q "device$"; then
    echo "No Android device connected. Please connect your phone via USB and enable USB debugging."
    exit 1
fi

# APK path
APK_PATH="build/app/outputs/flutter-apk/app-release.apk"

# Check if APK exists
if [ ! -f "$APK_PATH" ]; then
    echo "APK not found at $APK_PATH"
    echo "Please run 'flutter build apk --release' first"
    exit 1
fi

echo "Pushing APK to phone..."
adb install -r "$APK_PATH"

if [ $? -eq 0 ]; then
    echo "✅ APK installed successfully!"
    echo "You can now find 'Therapist Chatbot' in your app drawer"
else
    echo "❌ Failed to install APK"
    echo "Make sure USB debugging is enabled and you've accepted the connection on your phone"
fi 