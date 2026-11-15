/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.graphics.color;

//import java.awt.*;

class ColorUtil {
    private static final instance : ColorUtil = new ColorUtil();
    public static function getInstance() : ColorUtil {
        return ColorUtil.instance;
    }

    public function isGreyishOrWhiteLike(color : Color) : Bool {
        if (Math.abs(color.getRed() - color.getGreen()) > 20 || Math.abs(color.getRed() - color.getBlue()) > 20 || Math.abs(color.getGreen() - color.getBlue()) > 20) {
            return false;
        }
        return true;
    }

    public function isDark(color : Color) : Bool {
        if (color.getRed() < 0x77 && color.getRed() < 0x77 && color.getRed() < 0x77) {
            return true;
        }
        return false;
    }

    public function new() {
    }
}

