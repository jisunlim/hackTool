adb connect 127.0.0.1:62001
adb shell am start -a android.intent.action.MAIN -n $1
