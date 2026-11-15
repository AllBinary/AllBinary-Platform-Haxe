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
package org.allbinary.media.graphics.geography.map.platform;

import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListS;

class BasicPlatormGeographicMapCellType {
    private final types : haxe.ds.Vector<Int>;
    public static function createType(type : Int) : BasicPlatormGeographicMapCellType {
        final types : BasicArrayList = new BasicArrayListS(1);
        types.add(SmallIntegerSingletonFactory.getInstance().getAt(type));
        final basicPlatormGeographicMapCellType : BasicPlatormGeographicMapCellType = new BasicPlatormGeographicMapCellType(types);
        return basicPlatormGeographicMapCellType;
    }

    public function new(types : BasicArrayList) {
        final size : Int = types.size();
        final typeArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) 0]);
        var typeAsInteger : Null<Int> = null;
        var type : Int = 0;
        for (index in 0...size) {
            typeAsInteger = ((cast types.get(index) : Null<Int>));
            type = Std.int(typeAsInteger);
            new GeographicMapCellType(type, 0);
            typeArray[index] = type;
        }
        this.types = typeArray;
    }

    public function isType(type : GeographicMapCellType) : Bool {
        return this.hasType(type.getType());
    }

    public function hasType(type : Int) : Bool {
        final size : Int = types.length;
        for (index in 0...size) {
            if (this.types[index] == type) {
                return true;
            }
        }
        return false;
    }

}

