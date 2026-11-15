/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.graphics.font;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;

class MyFontProcessor {
    public static function defaultCharWidth(font : Font) : Int {
        return font.charWidth("C".code);
    }

    public static function defaultStringWidth(font : Font, size : Int) : Int {
        return MyFontProcessor.defaultCharWidth(font) * size;
    }

    private static final instance : MyFontProcessor = new MyFontProcessor();
    public static function getInstance() : MyFontProcessor {
        return MyFontProcessor.instance;
    }

    public function process(graphics : Graphics) : Void {
    }

    public function new() {
    }
}

