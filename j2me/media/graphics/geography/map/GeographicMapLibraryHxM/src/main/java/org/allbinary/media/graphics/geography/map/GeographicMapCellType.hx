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
package org.allbinary.media.graphics.geography.map;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class GeographicMapCellType {
    public static final NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY : haxe.ds.Vector<GeographicMapCellType> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public static final NULL_GEOGRAPHIC_MAP_CELL_TYPE : GeographicMapCellType = new GeographicMapCellType(Integer.MIN_VALUE, 0);
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final type : Int;
    public function new(type : Int, reset : Int) {
        this.type = type;
        if (type != Integer.MIN_VALUE) {
            final geographicMapCellTypeFactory : GeographicMapCellTypeFactory = GeographicMapCellTypeFactory.getInstance();
            final geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType> = geographicMapCellTypeFactory.getGeographicMapCellTypeArray();
            if (geographicMapCellTypeArray[type] == null || reset == 1) {
                geographicMapCellTypeArray[type] = this;
            } else {
                if (reset != -1) {
                    throw new haxe.Exception();
                }
            }
        }
    }

    public function getType() : Int {
        return this.type;
    }

    public function toString() : String {
        return SmallIntegerSingletonFactory.getInstance().getAt(this.type).toString();
    }

}

