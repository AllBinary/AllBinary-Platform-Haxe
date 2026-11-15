// Generated Code Do Not Modify
package org.allbinary.graphics.font;

import javax.microedition.lcdui.Font;
import org.allbinary.logic.string.StringMaker;

//OpenGLESBaseJ2MEJavaLibrary
class FontDebugBase {
    private static final instanceBase : FontDebugBase = new FontDebugBase();
    public static function getInstance() : FontDebugBase {
        return FontDebugBase.instanceBase;
    }

    public final SET_FONT : String = "setFont";
    public function debugMetrics(currentFont : Font, convertedTextSize : Float, displayMetrics : Any, stringBuffer : StringMaker) : Void {
    }

    public function debugDpi(densityDpi : Int, stringBuffer : StringMaker) : Void {
    }

    public function debugDimension(currentFont : Font, convertedTextSize : Float, longestDimensionTotalPixels : Int, stringBuffer : StringMaker) : Void {
    }

    public function new() {
    }
}

