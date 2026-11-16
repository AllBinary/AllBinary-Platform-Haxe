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

import org.allbinary.logic.string.StringUtil;

class SmallBasicColorCacheFactory {
    private static final instance : SmallBasicColorCacheFactory = new SmallBasicColorCacheFactory();
    public static function getInstance() : SmallBasicColorCacheFactory {
        return SmallBasicColorCacheFactory.instance;
    }

    private final SIZE : Int = 255;
    private final INDEX_TO_COLOR : haxe.ds.Vector<Int>;
    private final BASIC_COLOR_ARRAY : haxe.ds.Vector<BasicColor>;
    private var colorIndex : Int = 0;
    public function new() {
        this.INDEX_TO_COLOR = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.SIZE) 0]);
        this.BASIC_COLOR_ARRAY = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.SIZE) null]);
    }

    public function add(basicDefaultColor : BasicColor) : Void {
        this.BASIC_COLOR_ARRAY[this.colorIndex] = basicDefaultColor;
        this.INDEX_TO_COLOR[this.colorIndex] = basicDefaultColor.intValue();
        this.colorIndex++;
    }

    public function getAndOrCreate(colorAsInt : Int) : BasicColor {
        var basicColor : BasicColor = null;
        for (index in 0...this.SIZE) {
            if (this.INDEX_TO_COLOR[index] == colorAsInt) {
                return this.BASIC_COLOR_ARRAY[index];
            }
        }
        final ALPHA_MASK : Int = 0xFF000000;
        basicColor = BasicColorFactory.getInstance().createInstanceAN(colorAsInt & ALPHA_MASK, colorAsInt & 0x00FFFFFF, StringUtil.getInstance().EMPTY_STRING);
        this.add(basicColor);
        return basicColor;
    }

}

