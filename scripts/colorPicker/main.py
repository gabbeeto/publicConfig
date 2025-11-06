#!/usr/bin/env python3

import webview
import os
from pathlib import Path
from color import hexToRgb, rgbToHex, getTriadicsHue


class ColorInClipboard:
    def setColor(self, value, checked):

        r,g,b = hexToRgb(value)
        r =int(r* 225);
        g =int(g* 225);
        b =int(b* 225);

        command: str =  f"echo '{value}' | wl-copy" if not checked else f"echo '(Color){{ {r}, {g}, {b}, 255 }}' | wl-copy"
        os.system(command)
        os._exit(0)
userHome: str = str(Path.home())

webview.create_window(
    "select Color", str(Path.home()) + '/publicConfig/scripts/colorPicker/frontend/index.html',js_api=ColorInClipboard(), width=100, height= 170)
webview.start()
