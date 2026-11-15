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

//import java.awt.*;
import org.allbinary.logic.util.cache.CacheableInterface;

class ColorCacheable implements CacheableInterface {
    private var key : Any;
    private var color : Color;
    public function new(key : Any) {
        this.key = key;
        this.color = new Color(Std.int(((cast key : Null<Int>))));
    }

    public function getKey() : Any {
        return this.key;
    }

    public function getColor() : Color {
        return this.color;
    }

    public function setColor(color : Color) : Void {
        this.color = color;
    }

}

