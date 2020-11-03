adb=../tools/adb

$adb shell "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
