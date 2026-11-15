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
package org.allbinary.graphics;


class ItemColorFactory {
    private static final instance : ItemColorFactory = new ItemColorFactory();
    public static function getInstance() : ItemColorFactory {
        return ItemColorFactory.instance;
    }

    public var INVERT_PAINT : Int = 0xFF000000;
    public var PAINT : Int = 0xFFe07718;
    public var TEXT_FIELD_NO_FOCUS : Int = 0x7F7F7F;
    public function new() {
    }
}

