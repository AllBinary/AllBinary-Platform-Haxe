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
package org.allbinary.media.image.comparison.color;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.cache.CacheableInterface;
import org.allbinary.string.CommonSeps;

class ColorDelta implements CacheableInterface {
    private var rgb1 : Int = 0;
    private var rgb2 : Int = 0;
    private var key : Any;
    public function new(rgb1 : Int, rgb2 : Int) {
        this.setRgb1(rgb1);
        this.setRgb2(rgb2);
        this.key = ColorDelta.getKey(rgb1, rgb2);
    }

    public function getKey() : Any {
        return this.key;
    }

    public static function getKey(rgb1 : Int, rgb2 : Int) : Any {
        return new StringMaker().append(Std.string(rgb1)).append(CommonSeps.getInstance().UNDERSCORE).append(Std.string(rgb2)).toString();
    }

    public function getRgb1() : Int {
        return this.rgb1;
    }

    public function setRgb1(rgb1 : Int) : Void {
        this.rgb1 = rgb1;
    }

    public function getRgb2() : Int {
        return this.rgb2;
    }

    public function setRgb2(rgb2 : Int) : Void {
        this.rgb2 = rgb2;
    }

    public function toString() : String {
        return new StringMaker().append("ColorDelta: ").append(StringUtil.getInstance().toString(this.getKey())).append(" RGB1: ").appendint(this.getRgb1()).append(" RGB2: ").appendint(this.getRgb2()).toString();
    }

}

