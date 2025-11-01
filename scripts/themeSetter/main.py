import webview
from pathlib import Path
import os
import colorsys
import json

def hexToRgb(hex_color: str):
    # Remove # and spaces
    hex_color:str = hex_color.replace(' ', '').replace('#', '')

    # Convert hex to integers
    r:int = int(hex_color[0:2], 16)
    g:int = int(hex_color[2:4], 16)
    b:int = int(hex_color[4:6], 16)
    
    # returns a value between 0-1 again instead of degrees
    return float(r)/255.0, float(g)/255.0, float(b)/255.0

def getTriadicsHue(h: float):
    # I want to think in terms of degrees
    hueInDegrees: float= h * 360.0
    # add 120 degrees to the hue(remove 1 revolution if it's bigger than 360 degrees)
    firstExtraTriaticHue: float = hueInDegrees  + 120.0 if (hueInDegrees + 120.0 < 360.0) else ((hueInDegrees  + 120.0) - 360.0)
    # add 240 degrees to the hue(remove 1 revolution if it's bigger than 360 degrees)
    secondExtraTriaticHue: float= hueInDegrees  + 240.0 if (hueInDegrees + 240.0 < 360.0) else ((hueInDegrees  + 240.0) - 360.0)
    # turn into a value between 0-1 again instead of degrees
    firstExtraTriaticHue = firstExtraTriaticHue / 360.0
    secondExtraTriaticHue = secondExtraTriaticHue / 360.0
    return firstExtraTriaticHue,secondExtraTriaticHue 

def rgbToHex(r: float, g: float, b: float) -> str:
    # Convert from 0-1 back to 0-255
    r = int(r * 255)
    g = int(g * 255)
    b = int(b * 255)
    
    # Convert to hex and format
    return f"#{r:02x}{g:02x}{b:02x}"
def turnColorsIntoHexColorsForJson(hex:str):
    r,g,b= hexToRgb(hex)
    h,s,v= colorsys.rgb_to_hsv(r,g,b)

    t2,t3= getTriadicsHue(h)

    # turn into rgb
    r2,g2,b2 =colorsys.hsv_to_rgb(t2,s,v)
    r3,g3,b3 =colorsys.hsv_to_rgb(t3,s,v)

    hex2: str =rgbToHex(r2,g2,b2)
    hex3: str =rgbToHex(r3,g3,b3)

    isDarkColor: bool= v < 0.48
    textValue: float = 1.0 - v if isDarkColor else 0.0
    txtR,txtG,txtB =colorsys.hsv_to_rgb(0,0,textValue)
    hexForText: str =rgbToHex(txtR,txtG,txtB)

    hexColorDictionaries = {
    "color": hex,
    "color2": hex2,
    "color3": hex3,
    "textColor": hexForText
    }
    hexColorsInJson = json.dumps(hexColorDictionaries )
    return hexColorsInJson
    


class ThemeClass:
    def setColor(self, hex):
        hexColorsInJson =turnColorsIntoHexColorsForJson(hex)
        print(hexColorsInJson)

# "select Color", str(Path.home()) + '/publicConfig/scripts/colorPicker/frontend/index.html',js_api=ColorInClipboard()
webview.create_window("themer",str(Path.home()) + '/publicConfig/scripts/themeSetter/frontend/index.html',js_api=ThemeClass(),width=150,height=200)
webview.start()
