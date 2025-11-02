

def hexToRgbPercentage(hex_color: str):
    r,g,b = hexToRgb(hex_color)
    return r * 100.0, g * 100.0, b * 100.0


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
