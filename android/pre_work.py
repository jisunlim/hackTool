import os

class PreWork:
    def run(self):
        self.connect_device()
        self.run_frida_server()
        self.install_burp()

    def connect_device(self):
        device_list = os.popen('adb devices').read().split('\n')

        if len(device_list) == 4:
            device = device_list[1].split('\t')[0]
            print(''.join(['[*] connect with device (', device, ')']))
            return

        if input('> connect with Nox?(y/n) ').lower() == 'y':
            os.system('adb connect 127.0.0.1:62001')
            print(''.join(['[*] connect with device (127.0.0.1:62001)']))
            return

    def run_frida_server(self):
        cpu = os.popen('adb shell getprop ro.product.cpu.abi').read().split('\n')[0]

        if not os.popen('adb shell ls /data/local/tmp | grep frida-server').read():
            os.system(''.join(['adb push tools/frida-server-', cpu, ' /data/local/tmp/frida-server']))
            os.system('adb shell chmod 777 /data/local/tmp/frida-server')
            print('[*] install frida server')

        if not os.popen('adb shell ps | grep frida-server').read():
            os.system('adb shell /data/local/tmp/frida-server &')
            print('[*] run frida server')

    def install_burp(self):
        if os.popen('adb shell ls /system/etc/security/cacerts | grep 9a5ba575.0'):
            return

        os.system('adb push tools/cacert.pem /system/etc/security/cacerts/9a5ba575.0')
        os.system('adb shell chmod 644 /system/etc/security/cacerts/9a5ba575.0')
        os.system('adb shell reboot')
        print('[*] install burp certificate')
