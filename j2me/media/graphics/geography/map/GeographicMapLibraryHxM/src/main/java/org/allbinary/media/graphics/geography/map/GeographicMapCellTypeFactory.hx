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

class GeographicMapCellTypeFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : GeographicMapCellTypeFactory = new GeographicMapCellTypeFactory();
    public static function getInstance() : GeographicMapCellTypeFactory {
        return GeographicMapCellTypeFactory.instance;
    }

    private final geographicMapCellTypeArray : haxe.ds.Vector<GeographicMapCellType> = haxe.ds.Vector.fromArrayCopy([for (index in 0...512) null]);
    public function get(type : Int) : GeographicMapCellType {
        return this.geographicMapCellTypeArray[type];
    }

    public function getGeographicMapCellTypeArray() : haxe.ds.Vector<GeographicMapCellType> {
        return this.geographicMapCellTypeArray;
    }

    public function getStartType() : Int {
        throw new haxe.Exception();
    }

    public function getEndType() : Int {
        throw new haxe.Exception();
    }

    public function getEmptyType() : Int {
        throw new haxe.Exception();
    }

    public function isPath(cellType : GeographicMapCellType) : Bool {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

