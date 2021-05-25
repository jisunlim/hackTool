import os
from features import Features
from pre_work import PreWork

def select_package():
    package_list = os.popen('adb shell ls /data/app').read().split('\n')[:-1]

    print('\n========== packages ==========')
    for idx, package_name in enumerate(package_list):
        print(''.join([str(idx+1), '. ', package_name]))
    print('===============================')
    idx = int(input('> select package: ')) - 1

    return package_list[idx]

if __name__ == "__main__":
    prework = PreWork()
    prework.run()

    package_name = select_package()

    while(True):
        Features.show_menu()
        idx = int(input('> select menu: ')) - 1
        if idx == -1:
            exit()

        feature_list = [e.name for e in Features]
        feature = Features[feature_list[idx]]

        if feature.use_package_name:
            feature.run(package_name)
        else:
            feature.run()
