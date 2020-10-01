adb connect 127.0.0.1:62001
adb shell "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
