/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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

class FontDebugFactory {
    private static final instance : FontDebugFactory = new FontDebugFactory();
    public static function getInstance() : FontDebugFactory {
        return FontDebugFactory.instance;
    }

    public function setFont(font : Font, graphics : Graphics) : Void {
        graphics.setFont(font);
    }

    public function new() {
    }
}

