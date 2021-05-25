from enum import Enum
import utils

class Features(Enum):
    SHOW_CURRENT_PACKAGE = ('show current package', utils.show_current_package, True)
    PULL_APK = ('get apk', utils.pull_apk, True)
    PULL_DATA = ('get data', utils.pull_data, True)
    PUSH_DATA = ('overwrite data (in results dir)', utils.push_data, True)
    GET_CURRENT_ACTIVITY = ('tell current activity', utils.get_current_activity, False)
    START_ACTIVITY = ('start activity', utils.start_activity, False)
    DUMP_MEMORY = ('dump memory', utils.dump_memory, True)
    HOOKING = ('hooking', utils.hooking, True)

    def __init__(self, text, run, use_package_name):
        self.text = text
        self.run = run
        self.use_package_name = use_package_name

    def show_menu():
        print('\n========== menu ==========')
        for idx, feature in enumerate(Features):
            print(''.join([str(idx+1), '. ', feature.text]))
        print('\n0. exit')
        print('==========================')
