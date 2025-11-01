#!/usr/bin/env python3

import webview
import os
from pathlib import Path

class ColorInClipboard:
    def setColor(self, value):
        command: str =  "echo '" + value + "' | wl-copy"
        os.system(command)
        print(command)
        os._exit(0)
userHome: str = str(Path.home())

webview.create_window(
    "select Color", str(Path.home()) + '/publicConfig/scripts/colorPicker/frontend/index.html',js_api=ColorInClipboard(), width=100, height= 140)
webview.start()
