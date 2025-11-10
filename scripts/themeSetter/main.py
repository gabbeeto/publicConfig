#!/usr/bin/env python3

import webview
from pathlib import Path
import os
import colorsys
import json
from update import genrateFiles
from color import hexToRgb, rgbToHex, getTriadicsHue

def turnColorsIntoHexColorsForJson(hex:str):
    r,g,b= hexToRgb(hex)
    h,s,v= colorsys.rgb_to_hsv(r,g,b)

    t2,t3= getTriadicsHue(h)

    # turn into rgb
    r2,g2,b2 =colorsys.hsv_to_rgb(t2,s,v)
    r3,g3,b3 =colorsys.hsv_to_rgb(t3,s,v)

    r4,g4,b4 =colorsys.hsv_to_rgb(t3,1 - s,v)

    hex2: str =rgbToHex(r2,g2,b2)
    hex3: str =rgbToHex(r3,g3,b3)
    hex4: str =rgbToHex(r4,g4,b4)

    isDarkColor: bool= v < 0.48
    textValue: float = 1.0 - v if isDarkColor else 0.0
    txtR,txtG,txtB =colorsys.hsv_to_rgb(0,0,textValue)
    hexForText: str =rgbToHex(txtR,txtG,txtB)


    r5,g5,b5 =colorsys.hsv_to_rgb(0,0,v)
    textHue: str =rgbToHex(r5,g5,b5)

    incrementForNormalColor = 0.1
    add: float = 0.1
    r6,g6,b6 =colorsys.hsv_to_rgb(h + add if h + add < 1.0 else 1.0 - (h + add) ,s,v + incrementForNormalColor if v + incrementForNormalColor < 1.0 else v - incrementForNormalColor)
    color1WithValue: str =rgbToHex(r6,g6,b6)


    r8,g8,b8 =colorsys.hsv_to_rgb(h ,s,1.0 - v)
    color1Dark: str =rgbToHex(r8,g8,b8)

    r9,g9,b9 = colorsys.hsv_to_rgb(t3,t3, 0.8)
    color3ButWithValue = str =rgbToHex(r9,g9,b9)

    hexColorDictionaries = {
    "color1": hex,
    "color2": hex2,
    "color3": hex3,
    "color4": hex4,
    "hueColor": textHue,
    "textColor": hexForText,
    "color1Value": color1WithValue,
    "color1Dark":color1Dark,
    "color3Value":color3ButWithValue ,
    }
    hexColorsInJson = json.dumps(hexColorDictionaries )
    return hexColorsInJson
    

def dealWithWritingFile(hexColorsInJson:str):
    file =open(f"{Path.home()}/.config/theme/color.json","w")
    file.write(hexColorsInJson)
    file.close()

class ThemeClass:
    def setColor(self, hex):
        hexColorsInJson =turnColorsIntoHexColorsForJson(hex)
        dealWithWritingFile(hexColorsInJson)
        genrateFiles()


# "select Color", str(Path.home()) + '/publicConfig/scripts/colorPicker/frontend/index.html',js_api=ColorInClipboard()
webview.create_window("themer",str(Path.home()) + '/publicConfig/scripts/themeSetter/frontend/index.html',js_api=ThemeClass(),width=150,height=200)
webview.start()
