import os
import sys
import frida

def show_current_package(package_name):
    print(package_name)

def pull_apk(package_name):
    os.system(''.join(['adb pull /data/app/', package_name, '/base.apk results']))

def pull_data(package_name):
    os.system(''.join(['adb pull /data/data/', package_name[:-2], ' results']))

def push_data(package_name):
    os.system(''.join(['adb push results/', package_name[:-2], ' /data/data']))

def get_current_activity():
    result = os.popen('adb shell "dumpsys window windows | grep -E \'mCurrentFocus|mFocusedApp\'"').read().split('\n')[0]
    print(result.split(' ')[4][:-1])

def start_activity():
    activity = input('> input activity name: ')
    os.system(''.join(['adb shell am start -a android.intent.action.MAIN -n', activity]))

def dump_memory(package_name):
    if not os.path.exists('results/dump'):
        os.makedirs('results/dump')
    os.system(''.join(['python3 tools/fridump/fridump3.py -u -s ', package_name[:-2], ' -o results/dump']))

def on_message(message, data):
    print("{} -> {}".format(message, data))

def hooking(package_name):
    jscode = """
    Java.perform(function(){
        var path = Java.use("%s");
        path.%s.implementation = function() {
            console.log('[*] hooking Success!');
            return %s;
        }
    });
    """ % (input('> Class path: '), input('> method name: '), input('> return value: '))

    print(jscode)

    try:
        device = frida.get_usb_device(timeout=10)
        pid = device.spawn([package_name[:-2]])
        print("App is starting.. pid:{}".format(pid))
        process = device.attach(pid)
        device.resume(pid)
        script = process.create_script(jscode)
        script.on('message', on_message)
        print("[-] Running FR1DA!")
        script.load()
        sys.stdin.read()

    except Exception as e:
        print(e)
