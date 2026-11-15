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


class BasicColorUtil {
    private static final instance : BasicColorUtil = new BasicColorUtil();
    public static function getInstance() : BasicColorUtil {
        return BasicColorUtil.instance;
    }

    public final ZERO_ARRAY : haxe.ds.Vector<BasicColor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public final ALPHA : Int = 0xFF000000;
    public final isAlpha : Bool = true;
    public final ffOpaque : Bool = true;
    public function getRGB(red : Int, green : Int, blue : Int) : Int {
        var value : Int = 0;
        if (this.isAlpha) {
            if (this.ffOpaque) {
                value = this.ALPHA;
            }
        }
        value = (red << 16) | value;
        value = (green << 8) | value;
        value = blue | value;
        return value;
    }

    public function getARGB(alphaValue : Int, r : Int, g : Int, b : Int) : Int {
        return ((alphaValue << 24) & this.ALPHA) + ((r << 16) & 0x00FF0000) + ((g << 8) & 0x0000FF00) + (b & 0x000000FF);
    }

    public function get(alphaValue : Int, color : Int) : Int {
        return ((alphaValue << 24) & this.ALPHA) + color;
    }

    public function invert(color : Int) : Int {
        return (0xFFFFFF - color) | this.ALPHA;
    }

    public function new() {
    }
}

