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
package org.allbinary.graphics.color;

import javax.microedition.lcdui.Graphics;

class BasicColorSetUtil {
    private static final instance : BasicColorSetUtil = new BasicColorSetUtil();
    public static function getInstance() : BasicColorSetUtil {
        return BasicColorSetUtil.instance;
    }

    public function new() {
    }

    public function setBasicColorP(graphics : Graphics, basicColor : BasicColor) : Void {
        graphics.setColor(jre.lang.JavaObject.intValue(basicColor));
    }

    public function setBasicColorP3(graphics : Graphics, basicColor : BasicColor, value : Int) : Void {
        graphics.setColor(value);
    }

}

